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
BZh91AY&SY"�|r  ���>}���?������ D@ PV�F�Y^��	"I�&��~�~��z�����j�jC@2z��<�&�i	���  ��  4P2 DB $l��d�F@@ 24z���4hb241	�LA��a 	��<��d=@ =C@h4  4=H��T��*T<�\��D��ef`,�r�]R����ܱ��P�2�	�7j���&;U�������:������ֈי4`������t&4�ů�����ŋE���׏gm�v��Z�Mcp�}���c��F���o��3��M�ba�`�{���7ۈ߉�4u����"�l��J�uז����.\q]ÿȭ-iC43\�H$Ԛ�4�]m���b��&�A&%@J��dD�L�%iJPi1� �@�X�;���m��nPw�<<3��=�i��s�O�f���$/k4�(������T(���* !��H9���%)*,�h���_u*6���)��ff�"*a���h��D7cB��FZ����@����L뤄�+!1��IR��9d��(bD[
��-��)�,<l �BR�k�@e��o.I�`E؂Px36pI��&I�t����[E����__c;cg1Z&�u�}z��g�	�"RB	i�Lг�sr7�^�J8���$�ƅ�4X�{-�}u�n��(�mɤ/ ��䳽>aX��Z��I ��A��B`��)J����k!5`��B%4��؃��S$ds�ЃF,=�Z�H�[��I�$I#�TO��F0T�m������Dx�`Es����y-9�P�z�����ȐCË��ϫ0s�ĩ�����d&f�E����R��X�m�*�E`.P��2&.#�HL��;o�]��B@�u��