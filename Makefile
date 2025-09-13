CC=arm-linux-gnueabihf-gcc 
STRIP=arm-linux-gnueabihf-strip 
CFLAGS=-Ialsa/include -Ofast -mcpu=cortex-a9 -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations
LDFLAGS=-Lalsa/lib -lasound -lm -pthread
#-L/usr/arm-linux-gnueabihf/usr/lib

all : midilink mlinkutil

midilink: main.o modem.o serial.o serial2.o misc.o udpsock.o tcpsock.o alsa.o ini.o directory.o modem_snd.o
	$(CC) $(LDFLAGS) main.o modem.o serial.o serial2.o misc.o udpsock.o tcpsock.o alsa.o ini.o directory.o modem_snd.o -o $@
	$(STRIP) $@
mlinkutil: mlinkutil.o misc.o serial2.o tcpsock.o
	$(CC) $(CFLAGS) mlinkutil.o misc.o serial2.o tcpsock.o -o $@
	$(STRIP) $@
clean:
	rm -f midilink mlinkutil *~ *.orig *.o DEADJOE
	
	


