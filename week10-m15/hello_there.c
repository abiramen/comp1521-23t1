#include <stdio.h>
#include <pthread.h>

// int pthread_create(pthread_t *restrict thread,
//                           const pthread_attr_t *restrict attr,
//                           void *(*start_routine)(void *),
//                           void *restrict arg);

void *thread_run(void *data) {
    char *string = data;
    while (1) {
        printf("%s\n", string);
    }
    return NULL;
}

int main(void) {
    // TODO: create a thread
    
    pthread_t hello_thread;
    //             &hello_thread: pointer to uninitialised pthread_t to keep track of the thread id
    //                            NULL: thread attributes - can ignore for this course
    //                                  thread_run: function to be called on the new thread
    //                                              "hello": data passed to the new thread - this will be cast to a void* and back to a char*
    pthread_create(&hello_thread, NULL, thread_run, "hello");
    
    // TODO: print the main message
    while (1) {
        printf("there\n");
    }

    return 0;
}
