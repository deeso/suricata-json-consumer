#! /bin/sh
### BEGIN INIT INFO
# Provides:          suricata-json-consumer
# Required-Start:    suricata
# Required-Stop:     
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: solr
# Description:       solr
### END INIT INFO

SERVICE_NAME=suricata-json-consumer
PATH=/bin:/usr/bin:/sbin:/usr/sbin
DAEMON=/opt/suricata-consumer/suricata-json-consumer.sh
PIDFILE=/var/run/suricata-json-consumer.pid

test -x $DAEMON || exit 0

. /lib/lsb/init-functions

case "$1" in
  start)
     log_daemon_msg "Starting $SERVICE_NAME"
     start_daemon -p $PIDFILE $DAEMON
     log_end_msg $?
   ;;
  stop)
     log_daemon_msg "Stopping $SERVICE_NAME"
     killproc -p $PIDFILE $DAEMON
     PID=`ps x |grep feed | head -1 | awk '{print $1}'`
     kill -9 $PID       
     log_end_msg $?
   ;;
  force-reload|restart)
     $0 stop
     $0 start
   ;;
  status)
     status_of_proc -p $PIDFILE $DAEMON atd && exit 0 || exit $?
   ;;
 *)
   echo "Usage: /etc/init.d/atd {start|stop|restart|force-reload|status}"
   exit 1
  ;;
esac

exit 0