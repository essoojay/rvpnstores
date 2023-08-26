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
BZh91AY&SY'F� _�!P|��?�ߚ����@DA  P9��'w�p
 $�S�M��O(���� ��yC@h 4ԍ4҃@i�   �@ �R&��( �� �2���i��P�M �@�   "P�P4A��!�G�� �S@hdi�^L����x�f�p�J���%6�VW�e_)�i�qS�!���L��FD_�+^�BUBU�	�\�-�8��<T��;T �������ӗ��I!����ǆG3S�G\���F%��2ZT;Q�n���
P�3g2 ���\M�m�4�\s^��b�A �0a�?����(!��S-l:v7�:�'PJB	%u�f,6,��m�&�*/n�j�u$3D�U���S��(V�C=��G�Xn���R�F/�5�R1-��������n���-�L$	��"].��H4�&�~��(ӻ�pT��t���uY��=�9R�X�X�~p�f�sh��H�����	H!$<�����\��(��Y�G�Mw�{��N"��S,n���wOQ�sE�p��i23`1�rI��*�m��4�����|�Ux��=��j�J�||P$Ԃ�<7����`&͒I$�c��ly���YJ^w9Q�F�p�	w�
0���Al>�!��Y�����sAv�$	))KN�.g�����P;!܂���"�����Ah�������A2�L��P_o��.�ĝ{H��,��4WƂ�� ��~ئ���LC�!�ڮ������BL�YHC��`�mՙj@4��a����������(f�.���:S�����8�G�w��S��i(��8�6P�q���T�h�������r���8p���1.$r�8�>�@K �z6��$��_Ej��D2�r�jum:�t7Ѥdg!�-Mң�H���&�Be!'Sp��2�#������YB�WaB��	L${]h-]b_#/�P]� ��Q�:�yf��d�gJ�e��
���$�I)����F���5A~�[Q�j�����p\
��@�����B��YI҂�З$�RIFHg�^�M\5iT�"wqt�S����?�D"
���	8{;�p B�$�O�]��B@�