#include <malloc.h>
#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
int *guests;          // array of guests (0-women or 1-men).
int single[10];       // array of single rooms
int double_first[15]; // array of the first part of a double room
int double_second[15];// array of the first part of a double room
int n;                // amount of guests
char *output_filename;// name of file for output
FILE *output;
sem_t semaphore_single;  // semaphore for single rooms
sem_t semaphore_double;  // semaphore for double rooms
sem_t semaphore_removing;// semaphore for removing guests

// Fill array of guests with data from console
void readFromConsole() {
    printf("Enter number of guests:");
    scanf("%d", &n);
    guests = (int *) malloc(n * sizeof(int));
    printf("Enter guests: ");
    for (int i = 0; i < n; ++i) {
        scanf("%d", (guests + i));
    }
}

// Fill array of guests with generate data
void generate() {
    srand(time(NULL));
    n = 10 + rand() % (50 - 10);
    guests = (int *) malloc(n * sizeof(int));
    for (int i = 0; i < n; ++i) {
        *(guests + i) = rand() % 2;
    }
}

// Fill array of guests with data, which read from file
void readFromFile(char *file_name) {
    FILE *input = fopen(file_name, "r");
    fscanf(input, "%d", &n);
    guests = (int *) malloc(n * sizeof(int));
    for (int i = 0; i < n; ++i) {
        fscanf(input, "%d", (guests + i));
    }
    fclose(input);
}

// Remove guests from hotel (use random data for this)
void removing() {
    srand(time(NULL));
    int type_of_room = rand() % 2;
    if (type_of_room == 0) {
        int room_number = rand() % 10;
        if (single[room_number] != -1) {
            single[room_number] = -1;
            printf("A guest has checked out of single room number %d\n", room_number + 1);
            fprintf(output, "A guest has checked out of single room number %d\n", room_number + 1);
        }
    } else {
        int room_number = rand() % 15;
        int from_where = rand() % 2;
        if (from_where == 0 && double_first[room_number] != -1) {
            double_first[room_number] = -1;
            printf("A guest has checked out of double room number %d\n", room_number + 1);
            fprintf(output, "A guest has checked out of double room number %d\n", room_number + 1);
        }
        if (from_where == 1 && double_second[room_number] != -1) {
            double_second[room_number] = -1;
            printf("A guest has checked out of double room number %d\n", room_number + 1);
            fprintf(output, "A guest has checked out of double room number %d\n", room_number + 1);
        }
    }
}

// The main method which organize work of hotel, works in parallel
// Usage of mutex to prevent strange behaviour
void *settling(void *indexes) {
    printf("here %d thread\n", *((int *) indexes + 2));
    int index_start = *((int *) indexes);
    int index_end = *((int *) indexes + 1);
    int thread_number = *((int *) indexes + 2);
    for (int i = index_start; i < index_end; ++i) {
        srand(time(NULL));
        if (i % 2 == 0) {
            printf("Guest number %d wants to check in single room in reception %d \n", i + 1, thread_number);
            fprintf(output, "Guest number %d wants to check in single room in reception %d \n", i + 1, thread_number);
            int flag = 0;
            sem_wait(&semaphore_single);  // lock the code because there is a record of data into array
            for (int j = 0; j < 10; ++j) {// check all the single rooms
                if (single[j] == -1) {    // if where is an empty room - put guest there
                    single[j] = guests[i];
                    printf("Guest number %d check in single room number %d in reception %d \n", i + 1, j + 1, thread_number);
                    fprintf(output, "Guest number %d check in single room number %d in reception %d \n", i + 1, j + 1, thread_number);
                    flag = 1;
                    break;
                }
            }
            sem_post(&semaphore_single);// unlock the section because we stop working with  single rooms
            if (flag == 0) {
                printf("There are no available seats in single rooms for guest (info from reception %d)\n", thread_number);
                fprintf(output, "There are no available seats in single rooms for guest (info from reception %d)\n", thread_number);
            }
        } else {// we go here if we guest wants to live in double room
            printf("Guest number %d wants to check in double room in reception %d \n", i + 1, thread_number);
            fprintf(output, "Guest number %d wants to check in double room in reception %d \n", i + 1, thread_number);
            int flag = 0;
            sem_wait(&semaphore_double);  // lock the section because of working with double room
            for (int j = 0; j < 15; ++j) {// check all double rooms
                // Here we are checking if a guest can live in such room
                if (guests[i] == 0 && (double_first[j] == -1 || double_second[j] == -1)) {
                    if (double_first[j] == -1 && double_second[j] == -1) {
                        double_first[j] = 0;
                        flag = 1;
                    } else if (double_first[j] == -1 && double_second[j] == 0) {
                        double_first[j] = 0;
                        flag = 1;
                    } else if (double_second[j] == -1 && double_first[j] == 0) {
                        double_second[j] = 0;
                        flag = 1;
                    }
                } else if (guests[i] == 1 && (double_first[j] == -1 || double_second[j] == -1)) {
                    if (double_first[j] == -1 && double_second[j] == -1) {
                        double_first[j] = 1;
                        flag = 1;
                    } else if (double_first[j] == -1 && double_second[j] == 1) {
                        double_first[j] = 1;
                        flag = 1;
                    } else if (double_second[j] == -1 && double_first[j] == 1) {
                        double_second[j] = 1;
                        flag = 1;
                    }
                }
                if (flag == 1) {// we found an empty room
                    printf("We have checked in the guest number %d in the double room number %d in reception %d\n", i + 1, j + 1, thread_number);
                    fprintf(output, "We have checked in the guest number %d in the double room number %d in reception %d\n", i + 1, j + 1, thread_number);
                    break;
                }
            }
            sem_post(&semaphore_double);// unlock the section because we stop working with double room
            if (flag == 0) {            // we haven't found an empty room
                printf("There are no available seats in double rooms for guest (info from reception %d)\n", thread_number);
                fprintf(output, "There are no available seats in double rooms for guest (info from reception %d)\n", thread_number);
            }
        }
        if (i % 3 == 0) {                 // guest eviction
            sem_wait(&semaphore_removing);// lock the section because we will work with common data
            removing();
            sem_post(&semaphore_removing);
        }
    }
}

// State that in all rooms are empty
void fillArrays() {
    for (int i = 0; i < 10; ++i) {
        single[i] = -1;
    }
    for (int i = 0; i < 15; ++i) {
        double_first[i] = -1;
        double_second[i] = -1;
    }
};
int main(int argc, char *argv[]) {
    setbuf(stdout, 0);
    pthread_t receptionist_first, receptionist_second;
    // Initialize semaphores and for all say that only one thread can work in a locked section (third argument)
    sem_init(&semaphore_single, 0, 1);
    sem_init(&semaphore_double, 0, 1);
    sem_init(&semaphore_removing, 0, 1);
    printf("Now we will show you how the check-in to the hotel can take place\n");
    // Understand which type of getting data user will choose
    if (argc == 1) {
        printf("You have not specified where the data will be read from!\n");
        printf("Program will stop here\n");
        return 0;
    } else if (strcmp(argv[1], "console") == 0) {
        readFromConsole();
        output_filename = argv[2];
    } else if (strcmp(argv[1], "generate") == 0) {
        generate();
        output_filename = argv[2];
    } else if (strcmp(argv[1], "file") == 0) {
        readFromFile(argv[2]);
        output_filename = argv[3];
    } else {
        printf("Incorrect input! Program will stop here");
        return 0;
    }
    // Work with threads
    fillArrays();
    output = fopen(output_filename, "w");
    int indexes_first[3] = {0, n / 2, 1};
    pthread_create(&receptionist_first, NULL, settling, &indexes_first);
    int indexes_second[3] = {(n / 2) + 1, n - 1, 2};
    pthread_create(&receptionist_second, NULL, settling, &indexes_second);
    pthread_join(receptionist_first, NULL);
    pthread_join(receptionist_second, NULL);
}

