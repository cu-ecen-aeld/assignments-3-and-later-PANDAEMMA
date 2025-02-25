/*
 *  One difference from the write.sh instructions in Assignment 1:  You do not need to make your "writer" utility create directories which do not exist.  You can assume the directory is created by the caller.
 *
 *  Setup syslog logging for your utility using the LOG_USER facility.
 *
 *  Use the syslog capability to write a message “Writing <string> to <file>” where <string> is the text string written to file (second argument) and <file> is the file created by the script.  This should be written with LOG_DEBUG level.
 *
 *  Use the syslog capability to log any unexpected errors with LOG_ERR level.
 */

#include <stdio.h>
#include <syslog.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[]) {
    openlog(NULL, 0, LOG_USER);
    FILE *writefile;

    if (argc < 3) {
        syslog(LOG_ERR, "Error: not enough arguments. Need full path to file and text string to write");
        return 1;
    }

    writefile = fopen(argv[1], "w");
    if (writefile == NULL) {
        syslog(LOG_ERR, "Error: failed to open %s, errno:%d (%s)", argv[1], errno, strerror(errno));
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
    if (0 > fprintf(writefile, "%s\n",argv[2])) {
        syslog(LOG_ERR, "Error: failed to write to %s, errno:%d (%s)", argv[1], errno, strerror(errno));
        return 1;
    }
    fclose(writefile);
    closelog();
    return 0;
}
