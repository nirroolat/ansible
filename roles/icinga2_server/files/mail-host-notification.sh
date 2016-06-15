#!/bin/sh
template=`cat <<TEMPLATE
***** Icinga  *****

Notification Type: $NOTIFICATIONTYPE

Host: $HOSTALIAS
Address: $HOSTADDRESS
State: $HOSTSTATE

Date/Time: $LONGDATETIME

Additional Info: $HOSTOUTPUT

Comment: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT
TEMPLATE
`

/usr/bin/printf "%b" "$template" | /usr/local/bin/sendEmail -f icinga2@contoso.net -u "$NOTIFICATIONTYPE - $HOSTDISPLAYNAME - is $HOSTSTATE" -t $USEREMAIL -s smtp.contoso.net:25

