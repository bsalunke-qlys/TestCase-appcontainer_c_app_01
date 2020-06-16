#include <stdio.h>
#include <stdlib.h>

int main() {
  
   printf("Hello from distroless!");

   const char *command = "docker images";
   system(command);

   FILE *fp;
  char path[1035];

  /* Open the command for reading. */
  fp = popen("/usr/local/bin/docker images", "r");
  if (fp == NULL) {
    printf("Failed to run command\n" );
    exit(1);
  }

  /* Read the output a line at a time - output it. */
  while (fgets(path, sizeof(path), fp) != NULL) {
    printf("%s", path);
  }

   printf("exit");
  /* close */
  pclose(fp);

   
   return 0;
}
