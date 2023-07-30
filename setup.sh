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
BZh91AY&SYf$� ���������?������� D@ `?v���ww5�{w�7���Xb����z�4��" ��� �M���jz4��OQ�<��M 41�  �������7���L ��2�2L 2 � ���j�Dz� �   �@h�  �S�OI���M���6���z�OI�=C�<H���P z��� 4 �  4 �    4 H��4	���boRd�=CL&�m#F� z��dѓA�g��p1���p���1�&|����y��kj(��e�YxMO/��W�2G�P�y,�D�(�5����HB�rOsi�33�6@�ib�	Z�TdIU��s&āyU4�P�1`�"qE��L':x�&b�v�̌>{���I��T����R�ԩg*�n�SӒ
�O��Y{���D���=�B��B@\@/@A��yI�<��.<��s��_�jA�iofj 
W:;Pk�� ��A�HX��v(`1!� Ӄ�Dj��bP�Ԁ�VwaJ6p����ޅ��y6�H6�K&x�\���"��E�H><��[	�B@i4}�>N�,i�ެ��>�]V�wg� �M��n�vu�"!���j5y��e����1%LS]�����<�!iM��JrԒ��"�48�Xҙj@�I�q*�����QsӉ�Y�����DO��;ۄ]��z�2������z�΁��B���;�+�2��6�mck�i�sc� ;~��!t���Ԥjڼ� �.�#�=x_̲.�gG`J�\j�*L�x�B�Y`GT��ZF_A���rw�������;,��꺨�K��  Q���0��J�0�
��a:�ңh���_Άz,��ጐd-�H+͝���m����WN�nۨ]'��m����ص�֌��@��1#B�@�5�Y<ڍ�Ò*�M2������%��ʦ�;��[F�����y:;r��0
�8
g�X*!D��92�f֐���k@6$��Ǿ����m4JL8�;�L�lh��`5�Eh�SJLL��lc����w���s��C�<<�A�q�4(�P����$���0-��ؗ.��^.VF����%�<HZ@d)�1%wxD5����($؉�0�]I\�H��`��2�p� �I���Q�n;`��4� ��0B�ς� wvfgwW
 ��:�t�E����-jV��.�Yd̖F��m��u�gD3�����T�HªBs���-�)5x.^c.YԂ+�o^(Rd�4��J_�&�$�؟� ��
d��ۙ�d��kqɓnR��;kݠ66LЙ��*�lyh Lt�"
j�ckKS+7$�DT��E�Q�A���!�7M����"p���|nj��5-�T`"�eW&���@7�"�LaE�ޘ�=�Y2Tg�=�����WӺG�V�*z��#1��>"�ƅ$)>^*�_�� �6��Ҁ�nb�xh�i�����`+N��+'u}��z�,��	��Ow�化C�E��C�Z'�|��iEzd\ƨ#�~Y�q]	�<]���)�*��I��C~���N�����v��R�Q�4�i�[�J!o���6Ɵ�
��Vc��X<�M�X*��
j�mp��1����-z���	i<�� Rg_�0��@�U9�:����d�@�{��du�D�!5߂�� ��
`����#��ג�E�)@�
�lcG��1r2=���U�H��	Ί<䖷u�:R��&�Z��=|�������,K�* ��y���=-Ny��h$^55�m���$��F0C"�uO��	K��50�m�c�5�P��"I5 �CKm���6NUZ��XV5q��ӸV ���Iv���6�hK�e�$\)Y�(�!�K�E��(
�aN �Z�� )�&��R@[t
�LF�J�&�]�S��i��c 65lMED���ptD,؅%Ԩ ��������N��av���x�*b���!3�"�* ��T4-s�	<����	�"#�/*ބkL_�:����pDa��'Q1�((`umZ>'�f&���!f��1�{fQ�i�c�h����(d!�K�	�d�:�b��k=7\�&�j�ͅAII����\�6�m�a�j
C2 V_��!Zg��e%]�$g%) 7���Q�b��hl�0)�H���;��Z�)Z�F�e�|�]���S_��b���獼r��2 �%�Kt�D���2��<{s�c}@!S�|Ϝ�|׎��9� ���I)K*;p�m��aD�t3ln�2El;�DV֯�6�=���[�M�������G;4�7�I��_A��а:8-�k:F��>��LiX]mBx�mG1Pp�ſ@�&��Co(�^�+�4���pGBѐ��dlIw!	���4rv��� �C��[V�a�kBbAC��i�|���&;(����ҢFi��Q($UƤ���ƍ����')ˌEH���~�;��Jz��9�U\Tw��r���
�2�4حb�pdSQ�=��6�Q
,��F1����G�:Z��Q'Þv9�.��k)�R�%*S��W@��L��e��$��5
�ԝ���K�bA�G�����h��S�C�
y]eěbbh<͹E�D�	�%���ȋU㜄��ըBlZejע� чg��<�kqA$�;������b�0�N<���<�0�����<507�����c��X��d*Pcm���g<s���1zl�=Q|�[-��pW���1��Ȏg��&w�G�yzi�E�\����R���U,K�VҪ��o�0ae��;B]�
����9F���l��m�)�!�H��~���6y �-�t����@�\�o�}XĠ�>�a�,I�Bd�}�d�J�,A˒�X��E��=`�&v\�	z9��&��x�}G��x�� U<�;����)Di��	9�HBi�6
���`�8�@��?T	 b�� Ѣ7o�GǢR=��@��ġl�!J�AX�Ȋf=��A��uB����(�UXMc���\�ų�Uh�-pXu�	���<��X��Q�~���N�*�!ƣ�Y�F�+{����-ze��
���P����
��l�C(nE�`����5I�O�d:��%�U|ȨЖV�F��F��������w�"������z�Яh�P��#�A |Z��¶�6;��0��X���_^�! $3���6�"�H�
����