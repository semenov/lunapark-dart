kill `cat server.pid`
dart server.dart  > server.log 2>&1 &
echo $! > server.pid
exit 0