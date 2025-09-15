CC=arm-linux-gnueabihf-gcc 
STRIP=arm-linux-gnueabihf-strip 
CFLAGS=-Ialsa/include -Ofast -mcpu=cortex-a9 -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations
LDFLAGS=-Lalsa/lib -lasound -lm -pthread

all : midilink mlinkutil

midilink: main.o modem.o serial.o serial2.o misc.o udpsock.o tcpsock.o alsa.o ini.o directory.o modem_snd.o misc.h modem_snd.h tcpsock.h udpsock.h serial.h modem.h config.h directory.h serial2.h ini.h alsa.h
	$(CC) $(LDFLAGS) main.o modem.o serial.o serial2.o misc.o udpsock.o tcpsock.o alsa.o ini.o directory.o modem_snd.o -o $@
	$(STRIP) $@
mlinkutil: mlinkutil.o misc.o serial2.o tcpsock.o config.h tcpsock.h misc.h serial.h serial2.h
	$(CC) $(CFLAGS) mlinkutil.o misc.o serial2.o tcpsock.o -o $@
	$(STRIP) $@
clean:
	rm -f midilink mlinkutil *~ *.orig *.o DEADJOE
	
	


