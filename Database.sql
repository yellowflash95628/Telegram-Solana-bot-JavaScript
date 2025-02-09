PGDMP  -                    |         	   orcagundb %   14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)     16.1 (Ubuntu 16.1-1.pgdg22.04+1)      %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    16384 	   orcagundb    DATABASE     q   CREATE DATABASE orcagundb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE orcagundb;
                newuser_dev    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            )           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    16385    incomes    TABLE     4  CREATE TABLE public.incomes (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    sender_id character varying(255) NOT NULL,
    referral double precision,
    lucky double precision,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.incomes;
       public         heap    postgres    false    4            �            1259    16390    incomes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.incomes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.incomes_id_seq;
       public          postgres    false    209    4            *           0    0    incomes_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.incomes_id_seq OWNED BY public.incomes.id;
          public          postgres    false    210            �            1259    16391    settings    TABLE     {  CREATE TABLE public.settings (
    id character varying(255) NOT NULL,
    announcements boolean DEFAULT true NOT NULL,
    min_pos_value double precision DEFAULT '0.001'::double precision NOT NULL,
    auto_buy boolean DEFAULT false NOT NULL,
    auto_buy_amount double precision DEFAULT '0.1'::double precision NOT NULL,
    left_buy_amount double precision DEFAULT '1'::double precision NOT NULL,
    right_buy_amount double precision DEFAULT '5'::double precision NOT NULL,
    left_sell_amount double precision DEFAULT '25'::double precision NOT NULL,
    right_sell_amount double precision DEFAULT '100'::double precision NOT NULL,
    buy_slippage double precision DEFAULT '20'::double precision NOT NULL,
    sell_slippage double precision DEFAULT '20'::double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.settings;
       public         heap    postgres    false    4            �            1259    16404    tokens    TABLE     :  CREATE TABLE public.tokens (
    address character varying(255) NOT NULL,
    decimals integer,
    liquidity integer,
    mc double precision,
    name character varying(255),
    symbol character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.tokens;
       public         heap    postgres    false    4            �            1259    16409    trades    TABLE     }  CREATE TABLE public.trades (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    input_mint character varying(255) NOT NULL,
    in_amount double precision NOT NULL,
    output_mint character varying(255) NOT NULL,
    out_amount double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.trades;
       public         heap    postgres    false    4            �            1259    16414    trades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.trades_id_seq;
       public          postgres    false    4    213            +           0    0    trades_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.trades_id_seq OWNED BY public.trades.id;
          public          postgres    false    214            �            1259    16415    users    TABLE     �   CREATE TABLE public.users (
    id character varying(255) NOT NULL,
    referrer_id character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    16420    wallets    TABLE       CREATE TABLE public.wallets (
    id character varying(255) NOT NULL,
    public_key character varying(255) NOT NULL,
    secret_key character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.wallets;
       public         heap    postgres    false    4            x           2604    16441 
   incomes id    DEFAULT     h   ALTER TABLE ONLY public.incomes ALTER COLUMN id SET DEFAULT nextval('public.incomes_id_seq'::regclass);
 9   ALTER TABLE public.incomes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            �           2604    16442 	   trades id    DEFAULT     f   ALTER TABLE ONLY public.trades ALTER COLUMN id SET DEFAULT nextval('public.trades_id_seq'::regclass);
 8   ALTER TABLE public.trades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213                      0    16385    incomes 
   TABLE DATA           b   COPY public.incomes (id, user_id, sender_id, referral, lucky, created_at, updated_at) FROM stdin;
    public          postgres    false    209   _'                 0    16391    settings 
   TABLE DATA           �   COPY public.settings (id, announcements, min_pos_value, auto_buy, auto_buy_amount, left_buy_amount, right_buy_amount, left_sell_amount, right_sell_amount, buy_slippage, sell_slippage, created_at, updated_at) FROM stdin;
    public          postgres    false    211   �)                 0    16404    tokens 
   TABLE DATA           h   COPY public.tokens (address, decimals, liquidity, mc, name, symbol, created_at, updated_at) FROM stdin;
    public          postgres    false    212   �+                 0    16409    trades 
   TABLE DATA           u   COPY public.trades (id, user_id, input_mint, in_amount, output_mint, out_amount, created_at, updated_at) FROM stdin;
    public          postgres    false    213   �+       !          0    16415    users 
   TABLE DATA           H   COPY public.users (id, referrer_id, created_at, updated_at) FROM stdin;
    public          postgres    false    215   L1       "          0    16420    wallets 
   TABLE DATA           U   COPY public.wallets (id, public_key, secret_key, created_at, updated_at) FROM stdin;
    public          postgres    false    216   �2       ,           0    0    incomes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.incomes_id_seq', 32, true);
          public          postgres    false    210            -           0    0    trades_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.trades_id_seq', 34, true);
          public          postgres    false    214            �           2606    16428    incomes incomes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.incomes
    ADD CONSTRAINT incomes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.incomes DROP CONSTRAINT incomes_pkey;
       public            postgres    false    209            �           2606    16430    settings settings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public            postgres    false    211            �           2606    16432    tokens tokens_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (address);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    212            �           2606    16434    trades trades_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.trades DROP CONSTRAINT trades_pkey;
       public            postgres    false    213            �           2606    16436    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    16438    wallets wallets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.wallets DROP CONSTRAINT wallets_pkey;
       public            postgres    false    216               h  x���Mn!��ӧ�>2�������D4̋#��+�'�)
�r'�ڢ��[Xm�-����"^���H��o蝩k+���K	�r21�Z�;X�䟿A.���=�xR�i��;s�@/�p��}������c+M)cW	�2U�`ܱƻW�4�G���Zj�h�̝�xl��J�W������t?��Jmr�~IP�l��E2?�Zt�ZH�Ν%h��p�t���;x��p���b�"K H���hi�s�$ Z���Q�n��d��.I@��`�TK���$�\W���b���E��6�U'N��Vm���������u��$���8p�hv߀bn�$�E�B��y�	[���ȧ9I@�"l`��j>Izy�kv3߃D̵�$�q�F���|���ݭQ�4�Y��%��<�b�8c�b�J��"`��IL
����^�ln���C�g	X��O`lBɭt���a��K�28,�;E���Z%`[
(�����w�<z�,��Ql[��p�M���z�}<�qo�_p}n
n���mt7��x���sS���n�{˯>7E>r�6vH�o��M����g%;�,���E�52y�@^�,+�������yKHq[+� ~� j         �  x���Kn�0D��)�D`�'Jg�uN��chw'i۱�=��,
�X�����X"l���az���0��6�h����Fxf��U��ЕT�A��x��\���T<���F;�c�� <�jC�Rl�{��5Oz��?�-[%�#�Q*� �<��Tm�A'�b��Ճ�z����+$����}�����T�.0}���YL��=+����N>/��&�����in���cW�{6����{�AC��������é���l}�o�����j�{��Y����tuY��ԡ������m&���&�G��wH��l�Wh	Iށ�nڿJ.Rn�mv�ol`�W�#\l��[�MUDZ˟����8�6��(���!��=��8<����[���;�xo���/����2Tr���w��s�e�89+���$D�&�Lg�� �|Z.���q�����7Es����t�_�`y����ò�ی��_Ώl��R>\�Un��o-��4�S�            x������ � �         J  x�Ř�n"I���S�}ԥ�%���#�1e�Ŧ16��؆�����]#M��.��*�����#���Q�I�L�;���`��O��t�(=u:3+�_�۞�4T镠6,׫��^�|7�s�-����%|�&u�������.	<�
6����)u/��꩷Y��"W�2�w��~�#3�,�f��3H*8c���$A�҂<	ׁ�NZN1��p7.	�㞼��v����%�LJDTi�$ԗ ;4��b8	G�?$�����H�uVjk�H"ZoL���U��������E�u�[5�/;�n��������zD�&wU�
	�~a�lAg��V'���-h@$%��r���^c؈��y��>�_Kf=z5�Ѣ�n���p�, * Vj+Y����k�Դ�"��E"g����e,���BP��"�%2�B�班�
�Qq4��e�X�>})I ���z��l�o�*�v���cT.c31��j�2j�f�K�帻-�J3�J�8F�:�6]�S���.��F���e�8돚;��P";N^=_��([J��PRHp�&��l�?�:C�!�@�=���/`&�L�k��l�R����/�gg��,??�+%�8������f��v&�m�e�G�nk��->�
�k�}�H���2ٜ���g����0��w�Ǚ?$�Fx��9�{߫S\�Ł�Hj�%���%i��r�	4��`J� �F-����#3.��e�j3iV��;Wo�Ϻ�h�V�ci��7j����V���� �b�k{(o�Q�Gx�����oC�
n�buU�,/6������b�~��K���ew��\s�
�����7A�k�G#tf�KI£Ƣ�7^�b�y(_R�bT\�̈́w�x7&	�O����2�)&���I�� �?���R���w�2@8��qI��d\+jH����#�۸$P�_*���xg��5[�:W�=�J�����|��'����K�h�6�0I����%�t(偋m��"%	4����6h�u�����L'%��NwNu���4!A*7t��`���L"II��"j��@:�M�@���LJ����C�k|m�ǫ*D�j�]g���;ut��Me9Z-k���~X�]��F�`�e##	���ͻ��]��.���d;s��v���V���z�Z��Ie�-8iX��`�{Ȝ�����`s?��Ri�$(qՙk�Wth
�)�w�Y20Xk~s�oH?��'Y�2� :d'��V����o�Mkt��2����֪��bx���+���v�nFϵu�����s���2d���#g%A|�m.f`R�d�'�_d���e,@Hs��$�g ��^wPH      !   }  x�}��Q�0E�(
ߩQ��("���X�_��܋�T���	ޞo$��4y�xxM���G�A���+~Q3C�Hϸq�@�&~㸠f�	��:x�.F�cF���$f`|0��h�a�a���(�K�n��f�V5����$=�v�U�!!	��� �H�:f���k�;�f�N�f�5�T��qv�C��Z�L�1���A��U�ݍWŌ��u��2'����sj�ROL� =@�y �l�� %��4��㚛`g��bG�5 !G�݁�I낱;��DE�jC��^���ٱ�fTa�@�?=�ϟq�y� ��ܡ�l�Q7G�v�k��<�����?u�k����I3�����P�TE'�Jڳ��> J      "   �	  x�}WɎ�ʶS_��O��$HjFoщƦӛ�w�����:���SU�>,K!YZ+bERA��t��N"��=��E���8ɛ5��Zʷ<��Mڤ��$PQ՜�$̭#)S�����|g.����Sҧ"X�v���:Eט����`�"N&�T�0�C�u5A^H��� �.�$~G�������h@A��S�gj�tE�"]1}J��I�0����wo��<6��2Ab�U�;n�N�ƕM����h���fy2�ڭq��d84K���W��\�v˺X#}u4'�~rE�;"�?��z�ip!1˰���!�����_����/�����r�uA���=�#7$hH�K���zm�."heA����J�H[t6�@�G\���sR��K5/�I,Ҧ�����<}��+��w��a�F�h|���0C�g?���B�G�� {��<6n%�;7�� �Է*���1�U�W��S���ֆ���@)R�=���t�-���X��*�$x��
���N	)��ԜTV#��T�_���|@�~a�/*~@o4���4MJP�j_���fٻb��Ed7e��@��θy��=�K�:B���f�t�'^���_TgE��Z�)��-܉�bQ+<��:�ׄ�u?G�w�������nE����+@�z��)��M1�9�`�S��rAֽ,y@���M�9[�t����S���J	2I*g+w&��|Ma������D�j�F�K�)t��P��Rs ;C�m2�-�aH��y�+�Y}�D���q��I�_�$��9`�{!����z9�뷥Q&�l�[�	�u�ORRd�N��O��|�pF�[��X�$0�u�d�Y�\��l;6�D
�ȣ�Ns�
lM�ұ��{h��P2;�}��|\.$x��.�+�F3 @x��$�>���}�}1����2N̛-S믁�.R,�"��TyI�Ǩ��袦Ry�E-̆�C��ȋ��nA/��h��/2o�r��je��ުu3I=�G�+<�̼3�d�z�8��R�� �,#z2�4���t�j,������ �QReuf��L}�VV��pOJ�=�T^�Ry$l�B��rf@F�p��;Ƚex�w��*/��R��_�qr�Z�e���~R�����o�@4��!أ��}������F��H��9�C3�QO��o*��&��F@2�q���0Ε�����*Θ���ulo"ն��N��m�`�R�b(��6�uC����tc��t�/\� O�3�]�W��h|��fYB�6��r����ǈ��ߙ�׬�]�`�*��
šv:�j.���H:�+�]z���uKY]h�tL*��۪��YԽ�
M[��&X��N��l#�ԋz@���7U�\> 8�N�_��z#/,@����M!�[�y4X'QH�oIo����xf��V�~�4"��6�7ٺ$qԺ�ȼ�{�2�`S����d��ۨ�hƉ�,μ���M+S��su���ho��|�q��R��+I��Pg}@��~ͩ���.����i����j�r�FCح��X~y90�㼡�v�h�N@��e�S����Q�N[��5'�ׂ�:�>6|�{KK�G/�\�̮��ԅ��Ϛ�$/�8L㿹�����FF���_v�'t�����?��s�XelS�LN�z,�^�pԸ�K��b+��LP�Ď���N
>���=��Gô+�g9�ni�Ջ�V�f�NZ�RF�a��Z:E�,����8'S�W-����ݏ~G��)��}�g3$�zK��%�Y�򎧌9�X����r0�&ƯX��bY'�gb�	��R��V?�W29�{x��z�qd���b'�e��:�f��{�1�A޲\97*-׉%�pc,U���^�o����L��_��O�f�s.��H��꿄67���Y;U��c���#U��v�N 5�i]���&ty�{�������v�,Vs���J�͍�׾Ng@IB�fW�������]ܸ��)271���R���g ��$�-�<��N�OS�/䩃��� ��ц��Z�G�Ø��6P�1d�;�����"��Z�N���+����E�J��ԣİy5�c(�����_�j����LW�yS3s�8$yF�f����+��Ȟ������iL���"/Tq�t�إ(S��1��Mbg+j�����{�Vj�9|	q��+)Ie���wͪ��L�Wئ�7C8��a�^�M�QA �੽�{�����F�*@�2C���+������7p>3���@�NI�=l�E���֛y
�))n:ٺ��[LV��e�?>��+On�a*si�2Qv���n<L�A���a�@#k9��ǐ�)�v�a�>r�vmLn��0{�ۜg۟�b�����-CR,{�6�W�~L\|�e�m�C�d
#���8O�(�{5�e (���ǒU�(M�py{ǖ���R�xޞޚf��&�=�1�Nd�`�hGR�4�Xmh�3{���T6��3��\�_ \���y�Wo����������?sy     