#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYg�Fz  c_�|f���N����*0��[CDL�=OSz�L@��  @��j�P4 ��=@�)�G�%��3�0�4z���4�M�9�t��¾��ymf�c�a��*�R�$(�	�#����s�$#V��*m���H���1�ύ�0��k8�j�=�G�B��F��;��
�bw�V�'ea�d!�����_��FZ"$�s5���꫋�n$~�����Q�f�.X��`��9�H��*8^�;)���1

�*��_/ѾFЙͭhf_� Y�A�+�qdU�;�D��,���_)ɒ��Y��>P|ӘV�cT���BA&q�r�)���PI�P9@LQ&p���ʏMZ�A[f��RI �Rr 8���)hiI���F�����H�
��@