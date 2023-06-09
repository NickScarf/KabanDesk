PGDMP     5    4                {         	   kabandesk    13.11    13.11 #    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394 	   kabandesk    DATABASE     f   CREATE DATABASE kabandesk WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE kabandesk;
                postgres    false            �            1255    16477    info_stickers(integer)    FUNCTION        CREATE FUNCTION public.info_stickers(input_stickers integer) RETURNS TABLE(text character varying, id_users bigint, id_desks bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
SELECT stickers.text, stickers.id_users, stickers.id_desks FROM stickers WHERE stickers.id = input_stickers;
END;
$$;
 <   DROP FUNCTION public.info_stickers(input_stickers integer);
       public          postgres    false            �            1255    16476    info_users(integer)    FUNCTION     %  CREATE FUNCTION public.info_users(input_id integer) RETURNS TABLE(id_admin character varying, list_of_users bigint, id_stickers bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
SELECT desks.id_admin, desks.list_of_users, desks.id_stickers FROM desks WHERE desks.list_of_users = input_id;
END;
$$;
 3   DROP FUNCTION public.info_users(input_id integer);
       public          postgres    false            �            1259    16413    autorization    TABLE     �   CREATE TABLE public.autorization (
    id bigint NOT NULL,
    login character varying(150) NOT NULL,
    password character varying(50) NOT NULL
);
     DROP TABLE public.autorization;
       public         heap    postgres    false            �            1259    16411    autorization_id_seq    SEQUENCE     |   CREATE SEQUENCE public.autorization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.autorization_id_seq;
       public          postgres    false    201            �           0    0    autorization_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.autorization_id_seq OWNED BY public.autorization.id;
          public          postgres    false    200            �            1259    16429    desks    TABLE     �   CREATE TABLE public.desks (
    id_desk bigint NOT NULL,
    id_admin character varying(150),
    list_of_users bigint,
    id_stickers bigint
);
    DROP TABLE public.desks;
       public         heap    postgres    false            �            1259    16427    desks_id_desk_seq    SEQUENCE     z   CREATE SEQUENCE public.desks_id_desk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.desks_id_desk_seq;
       public          postgres    false    204            �           0    0    desks_id_desk_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.desks_id_desk_seq OWNED BY public.desks.id_desk;
          public          postgres    false    203            �            1259    16447    stickers    TABLE     �   CREATE TABLE public.stickers (
    id bigint NOT NULL,
    text character varying(250),
    id_users bigint,
    id_desks bigint
);
    DROP TABLE public.stickers;
       public         heap    postgres    false            �            1259    16445    stickers_id_seq    SEQUENCE     x   CREATE SEQUENCE public.stickers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.stickers_id_seq;
       public          postgres    false    206            �           0    0    stickers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.stickers_id_seq OWNED BY public.stickers.id;
          public          postgres    false    205            �            1259    16419    users    TABLE     �   CREATE TABLE public.users (
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    role character varying(150),
    autorization_id bigint,
    desks_id bigint
);
    DROP TABLE public.users;
       public         heap    postgres    false            4           2604    16416    autorization id    DEFAULT     r   ALTER TABLE ONLY public.autorization ALTER COLUMN id SET DEFAULT nextval('public.autorization_id_seq'::regclass);
 >   ALTER TABLE public.autorization ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            5           2604    16432    desks id_desk    DEFAULT     n   ALTER TABLE ONLY public.desks ALTER COLUMN id_desk SET DEFAULT nextval('public.desks_id_desk_seq'::regclass);
 <   ALTER TABLE public.desks ALTER COLUMN id_desk DROP DEFAULT;
       public          postgres    false    204    203    204            6           2604    16450    stickers id    DEFAULT     j   ALTER TABLE ONLY public.stickers ALTER COLUMN id SET DEFAULT nextval('public.stickers_id_seq'::regclass);
 :   ALTER TABLE public.stickers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206            �          0    16413    autorization 
   TABLE DATA           ;   COPY public.autorization (id, login, password) FROM stdin;
    public          postgres    false    201   �(       �          0    16429    desks 
   TABLE DATA           N   COPY public.desks (id_desk, id_admin, list_of_users, id_stickers) FROM stdin;
    public          postgres    false    204   �(       �          0    16447    stickers 
   TABLE DATA           @   COPY public.stickers (id, text, id_users, id_desks) FROM stdin;
    public          postgres    false    206   )       �          0    16419    users 
   TABLE DATA           W   COPY public.users (first_name, last_name, role, autorization_id, desks_id) FROM stdin;
    public          postgres    false    202   i)       �           0    0    autorization_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.autorization_id_seq', 1, false);
          public          postgres    false    200            �           0    0    desks_id_desk_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.desks_id_desk_seq', 1, false);
          public          postgres    false    203            �           0    0    stickers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.stickers_id_seq', 1, false);
          public          postgres    false    205            8           2606    16418    autorization autorization_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.autorization
    ADD CONSTRAINT autorization_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.autorization DROP CONSTRAINT autorization_pkey;
       public            postgres    false    201            :           2606    16434    desks desks_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.desks
    ADD CONSTRAINT desks_pkey PRIMARY KEY (id_desk);
 :   ALTER TABLE ONLY public.desks DROP CONSTRAINT desks_pkey;
       public            postgres    false    204            <           2606    16452    stickers stickers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.stickers
    ADD CONSTRAINT stickers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.stickers DROP CONSTRAINT stickers_pkey;
       public            postgres    false    206            @           2606    16463    desks desks_id_stickers_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.desks
    ADD CONSTRAINT desks_id_stickers_fkey FOREIGN KEY (id_stickers) REFERENCES public.stickers(id);
 F   ALTER TABLE ONLY public.desks DROP CONSTRAINT desks_id_stickers_fkey;
       public          postgres    false    206    2876    204            ?           2606    16440    desks desks_list_of_users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.desks
    ADD CONSTRAINT desks_list_of_users_fkey FOREIGN KEY (list_of_users) REFERENCES public.autorization(id);
 H   ALTER TABLE ONLY public.desks DROP CONSTRAINT desks_list_of_users_fkey;
       public          postgres    false    201    204    2872            B           2606    16458    stickers stickers_id_desks_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stickers
    ADD CONSTRAINT stickers_id_desks_fkey FOREIGN KEY (id_desks) REFERENCES public.desks(id_desk);
 I   ALTER TABLE ONLY public.stickers DROP CONSTRAINT stickers_id_desks_fkey;
       public          postgres    false    2874    206    204            A           2606    16453    stickers stickers_id_users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stickers
    ADD CONSTRAINT stickers_id_users_fkey FOREIGN KEY (id_users) REFERENCES public.autorization(id);
 I   ALTER TABLE ONLY public.stickers DROP CONSTRAINT stickers_id_users_fkey;
       public          postgres    false    2872    201    206            =           2606    16422     users users_autorization_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_autorization_id_fkey FOREIGN KEY (autorization_id) REFERENCES public.autorization(id);
 J   ALTER TABLE ONLY public.users DROP CONSTRAINT users_autorization_id_fkey;
       public          postgres    false    2872    201    202            >           2606    16435    users users_desks_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_desks_id_fkey FOREIGN KEY (desks_id) REFERENCES public.desks(id_desk);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_desks_id_fkey;
       public          postgres    false    2874    204    202            �   -   x�3�,���.-�/K�426200�2��/����ML͸b���� �
      �      x�3�4A�=... ��      �   I   x�> ��1	Создать хранимые процедуры	1	1
\.


��$S      �      x������ � �     