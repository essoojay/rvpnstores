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
BZh91AY&SYL��> Z��~}���?������ D@ PV�eٜ�i��g'&���L�<�5<�j=5��Fjd��S#z�F�ɦ���DК2�i4�jz�     �C@ )�M&��6��i�� <S@hi�   � d��A�b@�11  I��ʞC	� 2i�i�44� �@D���P�t���N��r�'s��5�);��2	�W�`�u�QAꃔ���f��XemI)!	:g�\�Ҙ�$X�	00�������%;>N�N3r�4c���[ދ88�oa���V�r��%{��X��2*Y��y8V֒q���D������N�آ*I;�J"�򎉯�cW}�Emn<]5j�ψ���ʖrW�T�Һժ�yR�|���F�O�f�:cdb=�sk��S�Y���f%J�c�Q1XNK��GO,r�|��R�5%S� �$�140ڈ���.�e�gI�Y�K=�RD�xk�h�2e����h�=���R�'�P��S��,�5�pg��6�Be�Ŏ�^b� ��k�'����K\f��I���{�"#&I�9�1#��J@��d����"�H�1&�Z���R�1 �d��ր\2��I$�I$��H�o����ҍ:E����to^����9>9m�L9�!������vM`�a�-�I�"<���a����Ũ����;�)�����?�lb�$���x+���k!]���w�;�3\ja6/D\�F�y`��D��h����ڲ��Qx�	���q��_b(���_p�Բ�.�a���� �+FR�Hn��0�S2�@R�hxI�fL��d��8�e��7��ʜ�1»���9�xTI���O�$%Vr2�A�^�c|���G[�e�۾����x�?���N]S�N�)|���M<r��V��ӛ9�s�b���0�'!�L;8���J�$��<MC��`(Q ʅ5}Q1-I7�(;w��Y`O�&Z�H=�Y,D���\�����ׅF<h&��w�1���@�,#v�g��Uq�zbE[��V2tMZ�Q�qF([>���Q��8���袅	�p�8S~���,��(,�:��+�
����+b�sh ���z���0��3��q�F@� �����,�`��2�Yi:A�Q��9�)��:�B�X2M�ۨ����51�;��B�=��HmAD��aę�ɷv�c��#��J��0Tn���n�Ş���G���a(��q��v��%����#2Ê��J���2(@�	��3$�|G	+���z���@�Z��&��-l%B��r�55�m�W ������5_�QV�>�VB��`�q�"h����G�q����%p��r�vM)�rK�15�����.�H�.�	�I	�������w$S�	�-c�