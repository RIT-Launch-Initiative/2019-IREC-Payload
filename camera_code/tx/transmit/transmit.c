/// RIT Launch Initiative
/// Transmits and records live video from raspberry pi
/// @author: Will Merges

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char* generate_pipeline(char* fps, char* outfile) {
    char* pipeline = malloc(sizeof(char)*1000);

    strcpy(pipeline, "gst-launch-1.0 -e v4l2src device=/dev/video0 ! tee name=t t. ! queue ! video/x-raw, width=640, height=480, framerate=");
    strcat(pipeline, fps);
    strcat(pipeline, "/1 ! videoconvert ! fbdevsink t. ! queue ! video/x-raw, target-bitrate=8000000, framerate=");
    strcat(pipeline, fps);
    strcat(pipeline, "/1 ! videoconvert ! queue ! videorate ! matroskamux ! filesink location=videos/");
    strcat(pipeline, outfile);

    return pipeline;
}

//fps must be 1, 15, or 30
//must run as root (on pi)
int main(int argc, char** argv) {
        system("mkdir -p videos");
        system("./start_camera.sh");
        system("./blank.sh");

        if (argc > 2) {
            char* pipeline = generate_pipeline(argv[1], argv[2]);
            printf("executing pipeline: %s\n", pipeline);
            system(pipeline);
        } else {
            fprintf(stderr, "usage: transmit [fps] [outfile]\n");
            return EXIT_FAILURE;
        }

        return EXIT_SUCCESS;
}
