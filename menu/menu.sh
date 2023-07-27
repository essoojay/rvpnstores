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
BZh91AY&SY:��Y ���}�  �����������pDA `��^��f׆��7�y`tͪղD{0����#L��F�&OHi4i�z��4���h4�њ��4	$L�ѡ1OL��0&M420��  h� �z&Jf��Sz��ѽF�jmM����jh @i�0"H�R��F�~��C$~�4z��=F�b4��M���d��S��p  �4444� � �hh � D�4���M�1�zj���(f��D���2
d �Y$��Z��b[�v�>1m����`�MxE[.~��J�F��.�c�Q�HR���o���)U�?58�ˆL䤑*+�OW.k'N�X?�s��u���m��Ts��|S��"Ԯ������ @�(��J�{�y/�|��sa���9X*�ιİ���!�g� �x^���~r�a��f�;�b�4E��fX�T)��3{�&�%p₉�p�@�6Dw�\X�ɨ���d�� S+����'���L���(-c�741�z(am���# �
6��p� (U=�ER��=��@䜜eK�`�	i�"��:�V}x�&��Zk�+��5�^��A��Q�cJ�1��Ev嚴���i��I��zJ�j�X�
���7S?f���\-o�V���x��e���Z{'e,��*
��5�S���Lܖ���u
�R\Q!c�S6��ί��Ԩ�>Z�M�d�Y�)�]]'F�L��cP�4T$��=���<�KwW�^B�$$mP�DN�7B�]�	�����=*ֽ�5Lڸ�q�~fڊ���]sT�@?P��6��%u�=.�xF�A��	�?,^�b�Sg�xN)EBcrd�mDb�Y	���ZS��bZ�w�+�����Qa0Ldn@	^�K��W!{Z�Jc	�2�BE�	��Lt?Ec�n��t��x<=���O�o������Ώz�(��#�ϸMǠ�D:���]�1������s��Jj��ՠ�b��w �f�S&���N����������։^�Ye�sb�N�@a us8 �׶((�Kp0��RQ��xd��r[���	M���矃�߬��ZA#��_:e�*\OW}��Lta�����-d �D �M̀��f�%��.pL����	
� �׏�U\��-Wĭ����&�-�4qE�E]u��⦦<�N���Hp�����x$o��,�y,���Y]r��zU��c�o�#�T!���!r�ɬXP�,���z� �y�v�lܒH��C�Mݪ�õ���������M��;gpv{[V��L{�j�3Ǿ�<�T�ЕܝE
�q*�mGX�Ib��Y�NJ���XT�"[�צ�ږŽ3xn�
��<���a��7�g�vx
�
��$��ե��?��p���-r+�� �<g����<e�R�3�?r���x*	��n_�ˁcpk�H�^��u0��_��fp�ē;�i1���_-s�y�q�}T�m���
9~�E%B-����%)AU�%��"@<4LOg
�4�.�?��cA�"�_)\�����$�6Z3d&�������T��c�t-����Y(�r"����C�.]?��p��NqٻnG��o�v����п�Ny�fj��(.��v��Ry�5?;<`S6}����q����O ��h 6Xt�D��L����+��������2E.��o�!�_��j#�*5R׵�NA`/�b������D[#ym�
��ف�k𱱙t�ϲ�"g��$T��E\	�l�tw̹���n�h1��ŕ$���ܟb�0�����omQ}��u5��̓��]�e��`�/��Q�����e�Z�9%6Iv�����Ob��5�m���y�4˒����_?6Iѧ�k%B��z	>,K�9U�8ظ�� Z��&��f'�o�f��17��c4�!�D�O��ۍ�< �
�0書�̖ S����]�=r�Y�|$$�
n+6^3|�����mr��!�lA���y�ԴS����BG�o��V�����M��0%2r�
�G:��Or�T�"S�^��@�s�Ge9"�� 5�`_B	�'N�X��5F�P��KX.�����X�����І��8f`ﮕ�>��
Ƅ#�G2�+�-��z�Q�%��e �	�#�վ���r�l��:��gk�Q���;�ؓ��c�6�����1�8�M3��,���j�Ι[y���j�H�Ⱥ�X�R��D��ko����D�ʬ�}�@��@rF�Ξbg^�<�&1��j*J�7k}Y�q�&ѣ9�Q����2$�%XA$�M�
z0��Vx+�x�/H��'\|KUxZ<a���������V	
"��gX#�P ���@�IuE�{ ���ך�xNE��(O��t�������r��4��ǡ%��s�J��k-q�AJ`��\hE	�v�)����ڂ��i:�P8JE�%C�f��C.=�iJȿ����lFe��M�ĉ(���c4��7�k%�ٯR
V>>J�u�������]q��{u��C'y':��3u(�\l���eb��S�F"�"�_<�j!��<�)L�)9�˗
"eŪ�:
�1+4d`�
���4��.WJ�qH1s�rD�PAm>Y ;���Y�0P�DH�1����>�N^lI�.f��\�	fs;$�!s���,�GT�Z�6(.qf۟��`?JT?�G�H�A�w�	�1u�L���IF�A��}�/�9t1����9�	l�Omz���2R��/H��E��'hlp�S �>�pi���ǝ�*p�m꥕� p��� ����A�@B�����g.�@�h�r$�����Ųl�v
�M��\�w����PE�TE��ym�Pd����*��E���j����ܑN$���@
