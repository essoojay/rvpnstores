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
BZh91AY&SY���  |_�DTx��3� ����@����S��z���ƣhHѣ�Ѧ�4 jh�z��fHh���  5S�*=LOP�ɠ�����`I	52�L���S��6��L��a���~�Նc�b-@��	�,��w�x�+TA2ؙ�s���
��w~l{c��X�e�O�i)FU��qJ)/#�?Z�y�A�\*�@��9�����E9�8�1`��)�k\�%��T�:9Nkx9i�C)����y#��Æ�w-+6��1Dĳ��-����(mQ)����c'�9�X�/����W�0̑%X�f\�/Ua!_ ��֊:��,M�����b$��%(����l��K�8��5q��=T�rC&L��Z����f}�ڙ��ri�`�����E�n$�����J�W���L��[�$�B� ��tP��7�R@�rk*������~��.AD�26��}Z��NZ�:7��	\��lD'��+"��[cTM�fa������pWʴ�[�4F�w7ŕ��'ĽA��O��Dxs)�M�lOO��Rz�v�UɁ]���8օO�Ȃ�^)B�:�(�P3�x��������
�V	ե�q��Pn�ƚ����i��HU�A|�r�S�ڱYjD+Bt�	���]��BC�{\