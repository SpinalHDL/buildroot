/*#include <stdio.h>

int main(void) {
    puts("hello world");
}*/

#include "stdint.h"

volatile uint64_t global;
#include <stdio.h>

#define testWrite(cast, offset, value) \
global = 0; \
*((cast*)(((uint8_t*)(&global)) + offset)) = value; \
printf("%s %llx %llx\n", global == ((uint64_t) value) << 8*offset ? "PASS" : "FAIL", global, ((uint64_t) value) << 8*offset); \


#define testRead(type, offset, value) {\
global = ((uint64_t) value) << 8*offset; \
volatile type * ptr = ((volatile type*)(((uint8_t*)(&global)) + offset)); \
volatile type buf = *ptr; \
printf("%s %llx %llx\n", buf == ((type)value) ? "PASS" : "FAIL", (uint64_t) buf,(uint64_t) value); \
} \

int main(void) {
    puts("Unaligned access tester 3\n");
	testWrite(uint32_t, 0, 0x1c3606d3);
	testWrite(uint32_t, 1, 0x01d60053);
	testWrite(uint32_t, 2, 0xa76b0711);
	testWrite(uint32_t, 3, 0xa424721e);


	testWrite(uint16_t, 0, 0x3a96);
	testWrite(uint16_t, 1, 0x85d2);
	testWrite(uint16_t, 2, 0xaa20);
	testWrite(uint16_t, 3, 0x4978);


	testRead(uint32_t, 0, 0xdbf1e7ed);
	testRead(uint32_t, 1, 0x52ab9a0b);
	testRead(uint32_t, 2, 0xc217c584);
	testRead(uint32_t, 3, 0x50a1b005);


	testRead(uint16_t, 0, 0xdbea);
	testRead(uint16_t, 1, 0x2fae);
	testRead(uint16_t, 2, 0xcfa4);
	testRead(uint16_t, 3, 0x039e);


	testRead(int16_t, 0, 0x495f);
	testRead(int16_t, 1, 0xdbd7);
	testRead(int16_t, 2, 0x932e);
	testRead(int16_t, 3, 0x2f03);

    puts("Done\n");
}



/*
#include <stdio.h>
#include <poll.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>

#define GPIO_FN_MAXLEN	32
#define POLL_TIMEOUT	1000
#define RDBUF_LEN	5

int main(int argc, char **argv) {
	char fn[GPIO_FN_MAXLEN];
	int fd,ret;
	struct pollfd pfd;
	char rdbuf[RDBUF_LEN];

	memset(rdbuf, 0x00, RDBUF_LEN);
	memset(fn, 0x00, GPIO_FN_MAXLEN);

	if(argc!=2) {
		printf("Usage: %s <GPIO>\nGPIO must be exported to sysfs and have enabled edge detection\n", argv[0]);
		return 1;
	}
	snprintf(fn, GPIO_FN_MAXLEN-1, "/sys/class/gpio/gpio%s/value", argv[1]);
	fd=open(fn, O_RDONLY);
	if(fd<0) {
		perror(fn);
		return 2;
	}
	pfd.fd=fd;
	pfd.events=POLLPRI;
	
	ret=read(fd, rdbuf, RDBUF_LEN-1);
	if(ret<0) {
		perror("read()");
		return 4;
	}
	printf("value is: %s\n", rdbuf);
	
	while(1) {
		memset(rdbuf, 0x00, RDBUF_LEN);
		lseek(fd, 0, SEEK_SET);
		ret=poll(&pfd, 1, POLL_TIMEOUT);
		if(ret<0) {
			perror("poll()");
			close(fd);
			return 3;
		}
		if(ret==0) {
			printf("timeout\n");
			continue;
		}
		ret=read(fd, rdbuf, RDBUF_LEN-1);
		if(ret<0) {
			perror("read()");
			return 4;
		}
		printf("interrupt, value is: %s\n", rdbuf);
	}
	close(fd);
	return 0;
}
*/
