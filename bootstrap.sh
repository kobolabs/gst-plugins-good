#!/bin/bash 
[ ! -e configure ] && NOCONFIGURE=1 ./autogen.sh

GLIB_GENMARSHAL="`which glib-genmarshal`" \
GLIB_MKENUMS="`which glib-mkenums`" \
LDFLAGS="-Wl,-rpath,/lib -Wl,-rpath,/usr/lib" \
CFLAGS="-fPIC -fno-omit-frame-pointer -funwind-tables -Wl,--no-merge-exidx-entries" \
./configure --host=arm-linux --prefix= --with-sysroot=/chroot --enable-debug --disable-nls --disable-valgrind --disable-examples --disable-valgrind --disable-examples --enable-mpg123 --disable-videofilter --disable-alpha --disable-apetag --disable-audiofx --disable-auparse --disable-avi --disable-cutter --disable-debugutils --disable-deinterlace --disable-effectv --disable-equalizer --disable-flv --disable-icydemux --disable-interleave --disable-flx --disable-goom --disable-goom2k1 --disable-imagefreeze --enable-isomp4 --disable-law --disable-level --disable-matroska --disable-monoscope --disable-multifile --disable-multipart --disable-replaygain --disable-rtp --disable-rtpmanager --disable-rtsp --disable-shapewipe --disable-smpte --disable-spectrum --disable-udp --disable-videobox --disable-videocrop --disable-videomixer --disable-y4m --disable-directsound --disable-waveform --disable-oss --disable-oss4 --disable-osx_audio --disable-osx_video --disable-gst_v4l2 --disable-x --disable-aalib --disable-aalibtest --disable-cairo --disable-flac --disable-gdk_pixbuf --disable-dtmf --disable-jack --disable-jpeg --disable-libcaca --disable-libdv --disable-libpng --disable-pulse --disable-dv1394 --disable-shout2 --disable-soup --disable-speex --disable-taglib --disable-wavpack --disable-zlib --disable-bz2
make -j8
make DESTDIR=/chroot install
