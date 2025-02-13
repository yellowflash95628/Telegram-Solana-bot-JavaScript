PGDMP  )                     |         	   sniperbot    16.1    16.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16397 	   sniperbot    DATABASE     �   CREATE DATABASE sniperbot WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE sniperbot;
                postgres    false            �            1259    16458    incomes    TABLE     4  CREATE TABLE public.incomes (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    sender_id character varying(255) NOT NULL,
    referral double precision,
    lucky double precision,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.incomes;
       public         heap    postgres    false            �            1259    16457    incomes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.incomes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.incomes_id_seq;
       public          postgres    false    220                       0    0    incomes_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.incomes_id_seq OWNED BY public.incomes.id;
          public          postgres    false    219            �            1259    16442    settings    TABLE     {  CREATE TABLE public.settings (
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
       public         heap    postgres    false            �            1259    16421    tokens    TABLE     :  CREATE TABLE public.tokens (
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
       public         heap    postgres    false            �            1259    16467    trades    TABLE     }  CREATE TABLE public.trades (
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
       public         heap    postgres    false            �            1259    16466    trades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.trades_id_seq;
       public          postgres    false    222                       0    0    trades_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.trades_id_seq OWNED BY public.trades.id;
          public          postgres    false    221            �            1259    16428    users    TABLE     �   CREATE TABLE public.users (
    id character varying(255) NOT NULL,
    referrer_id character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16435    wallets    TABLE       CREATE TABLE public.wallets (
    id character varying(255) NOT NULL,
    public_key character varying(255) NOT NULL,
    secret_key character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.wallets;
       public         heap    postgres    false            o           2604    16461 
   incomes id    DEFAULT     h   ALTER TABLE ONLY public.incomes ALTER COLUMN id SET DEFAULT nextval('public.incomes_id_seq'::regclass);
 9   ALTER TABLE public.incomes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            p           2604    16470 	   trades id    DEFAULT     f   ALTER TABLE ONLY public.trades ALTER COLUMN id SET DEFAULT nextval('public.trades_id_seq'::regclass);
 8   ALTER TABLE public.trades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222                      0    16458    incomes 
   TABLE DATA           b   COPY public.incomes (id, user_id, sender_id, referral, lucky, created_at, updated_at) FROM stdin;
    public          postgres    false    220   e%                 0    16442    settings 
   TABLE DATA           �   COPY public.settings (id, announcements, min_pos_value, auto_buy, auto_buy_amount, left_buy_amount, right_buy_amount, left_sell_amount, right_sell_amount, buy_slippage, sell_slippage, created_at, updated_at) FROM stdin;
    public          postgres    false    218   �%                 0    16421    tokens 
   TABLE DATA           h   COPY public.tokens (address, decimals, liquidity, mc, name, symbol, created_at, updated_at) FROM stdin;
    public          postgres    false    215   &                 0    16467    trades 
   TABLE DATA           u   COPY public.trades (id, user_id, input_mint, in_amount, output_mint, out_amount, created_at, updated_at) FROM stdin;
    public          postgres    false    222   ,&                 0    16428    users 
   TABLE DATA           H   COPY public.users (id, referrer_id, created_at, updated_at) FROM stdin;
    public          postgres    false    216   I&                 0    16435    wallets 
   TABLE DATA           U   COPY public.wallets (id, public_key, secret_key, created_at, updated_at) FROM stdin;
    public          postgres    false    217   �&                  0    0    incomes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.incomes_id_seq', 1, false);
          public          postgres    false    219                       0    0    trades_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.trades_id_seq', 1, false);
          public          postgres    false    221            z           2606    16465    incomes incomes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.incomes
    ADD CONSTRAINT incomes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.incomes DROP CONSTRAINT incomes_pkey;
       public            postgres    false    220            x           2606    16456    settings settings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public            postgres    false    218            r           2606    16427    tokens tokens_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (address);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    215            |           2606    16474    trades trades_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.trades DROP CONSTRAINT trades_pkey;
       public            postgres    false    222            t           2606    16434    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            v           2606    16441    wallets wallets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.wallets DROP CONSTRAINT wallets_pkey;
       public            postgres    false    217                  x������ � �         }   x���K
A��ur
�2!�W��,���]���@A-~�2���0�;���n���,	�d�Yl�������h\�_�Bz�w�i?L���'��Z�1��o&�q�$�9���g|_�.��W�]���uD5            x������ � �            x������ � �         j   x�u̻A��\9����wTp��A���#���j&��^v��"ƘrU=����:�ʷ�a!�Ň(B�ٵ90����(:����~蘎����%��0Q3�         $  x�}��n�@ E��+��b1`ƻ`^2�F��`@`�1`�>]�Ju}6��+a�R(
r�z~j��^�1H�$?��h,��̹4�X�ZuVg'�pKՃE��4�n�qs�md�g��iJ�����8�]��ȍ�ue!�[	��yT(Y�����%����!~� ?D��`�+�(�md !	"B$���4K�iV�c�B��=���ݽ���@�vZ��ّ�n�^�G�9�+��eD�&K*'����`X�1{����C6��1�����_�����h�����cg�m����b�Ő~��md��P�A��dV+˹:e�7�š��J�yu��FQ�n���"�HzLuN0��ٚ4�{��e9�Z�z���/�>��h���)����\5ȨY]�4�"��®�u�; ��3���L�PQ��`��BW��t�Hu+|r/Y��5�����S�p�J:w{��J���A4�̹��&#��~h	J�i�Q�l�~��ܝ�c�˒j�ң�fF�^�wt��*�v��id:�*�a�h+C���3���n6�re��     