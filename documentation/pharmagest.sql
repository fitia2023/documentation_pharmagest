PGDMP          &                 |         
   pharmagest    15.6    15.6 @    M           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            N           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            O           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            P           1262    16814 
   pharmagest    DATABASE     }   CREATE DATABASE pharmagest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE pharmagest;
                postgres    false            �            1259    16815    commande    TABLE     	  CREATE TABLE public.commande (
    id_commande integer NOT NULL,
    date_commande date,
    prix_total double precision,
    id_fournisseur integer,
    prix_payer double precision DEFAULT 0.0,
    statut character varying DEFAULT 'En cours'::character varying
);
    DROP TABLE public.commande;
       public         heap    postgres    false            �            1259    16818    commande_id_commande_seq    SEQUENCE     �   CREATE SEQUENCE public.commande_id_commande_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.commande_id_commande_seq;
       public          postgres    false    214            Q           0    0    commande_id_commande_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.commande_id_commande_seq OWNED BY public.commande.id_commande;
          public          postgres    false    215            �            1259    16819    fournisseur    TABLE     �   CREATE TABLE public.fournisseur (
    id_fournisseur integer NOT NULL,
    nom_fournisseur character varying,
    adresse_fournisseur character varying,
    tel_fournisseur integer
);
    DROP TABLE public.fournisseur;
       public         heap    postgres    false            �            1259    16824    fournisseur_id_fournisseur_seq    SEQUENCE     �   CREATE SEQUENCE public.fournisseur_id_fournisseur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.fournisseur_id_fournisseur_seq;
       public          postgres    false    216            R           0    0    fournisseur_id_fournisseur_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.fournisseur_id_fournisseur_seq OWNED BY public.fournisseur.id_fournisseur;
          public          postgres    false    217            �            1259    16825    lignecommande    TABLE     �   CREATE TABLE public.lignecommande (
    id_medicament integer NOT NULL,
    id_commande integer NOT NULL,
    qt_vente integer,
    qt_recu double precision DEFAULT 0.0
);
 !   DROP TABLE public.lignecommande;
       public         heap    postgres    false            �            1259    16828 
   lignevente    TABLE     v   CREATE TABLE public.lignevente (
    id_vente integer NOT NULL,
    id_medicament integer NOT NULL,
    qt integer
);
    DROP TABLE public.lignevente;
       public         heap    postgres    false            �            1259    16831 	   listeprix    TABLE     �   CREATE TABLE public.listeprix (
    id_fournisseur integer NOT NULL,
    id_medicament integer NOT NULL,
    prix_unitaire double precision,
    qt integer,
    prix_vente double precision
);
    DROP TABLE public.listeprix;
       public         heap    postgres    false            �            1259    16834 
   medicament    TABLE     X  CREATE TABLE public.medicament (
    id_medicament integer NOT NULL,
    nom_medicament character varying,
    famille character varying,
    ordonnance boolean,
    prix_vente double precision,
    qt_stock integer,
    qt_min integer,
    qt_max integer,
    seuil_commande integer,
    unite character varying,
    id_fournisseur integer
);
    DROP TABLE public.medicament;
       public         heap    postgres    false            �            1259    16839    medicament_id_medicament_seq    SEQUENCE     �   CREATE SEQUENCE public.medicament_id_medicament_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.medicament_id_medicament_seq;
       public          postgres    false    221            S           0    0    medicament_id_medicament_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.medicament_id_medicament_seq OWNED BY public.medicament.id_medicament;
          public          postgres    false    222            �            1259    16840    prescription    TABLE     �   CREATE TABLE public.prescription (
    id_prescription integer NOT NULL,
    nom_medecin character varying,
    date_prescription date,
    nom_patient character varying
);
     DROP TABLE public.prescription;
       public         heap    postgres    false            �            1259    16845     prescription_id_prescription_seq    SEQUENCE     �   CREATE SEQUENCE public.prescription_id_prescription_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.prescription_id_prescription_seq;
       public          postgres    false    223            T           0    0     prescription_id_prescription_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.prescription_id_prescription_seq OWNED BY public.prescription.id_prescription;
          public          postgres    false    224            �            1259    16846    utilisateur    TABLE     �  CREATE TABLE public.utilisateur (
    id_utilisateur integer NOT NULL,
    nom_utilisateur character varying,
    prenom_utilisateur character varying,
    annif_utilisateur date,
    adresse_utilisateur character varying,
    tel_utilisateur integer,
    identifiant character varying,
    mot_de_passe character varying,
    role character varying,
    actif boolean,
    bloquer boolean
);
    DROP TABLE public.utilisateur;
       public         heap    postgres    false            �            1259    16851    utilisateur_id_utilisateur_seq    SEQUENCE     �   CREATE SEQUENCE public.utilisateur_id_utilisateur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.utilisateur_id_utilisateur_seq;
       public          postgres    false    225            U           0    0    utilisateur_id_utilisateur_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.utilisateur_id_utilisateur_seq OWNED BY public.utilisateur.id_utilisateur;
          public          postgres    false    226            �            1259    16852    vente    TABLE     �   CREATE TABLE public.vente (
    id_vente integer NOT NULL,
    date_vente date,
    prix_total double precision,
    payer boolean,
    id_prescription integer
);
    DROP TABLE public.vente;
       public         heap    postgres    false            �            1259    16855    vente_id_vente_seq    SEQUENCE     �   CREATE SEQUENCE public.vente_id_vente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.vente_id_vente_seq;
       public          postgres    false    227            V           0    0    vente_id_vente_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.vente_id_vente_seq OWNED BY public.vente.id_vente;
          public          postgres    false    228            �           2604    16856    commande id_commande    DEFAULT     |   ALTER TABLE ONLY public.commande ALTER COLUMN id_commande SET DEFAULT nextval('public.commande_id_commande_seq'::regclass);
 C   ALTER TABLE public.commande ALTER COLUMN id_commande DROP DEFAULT;
       public          postgres    false    215    214            �           2604    16857    fournisseur id_fournisseur    DEFAULT     �   ALTER TABLE ONLY public.fournisseur ALTER COLUMN id_fournisseur SET DEFAULT nextval('public.fournisseur_id_fournisseur_seq'::regclass);
 I   ALTER TABLE public.fournisseur ALTER COLUMN id_fournisseur DROP DEFAULT;
       public          postgres    false    217    216            �           2604    16858    medicament id_medicament    DEFAULT     �   ALTER TABLE ONLY public.medicament ALTER COLUMN id_medicament SET DEFAULT nextval('public.medicament_id_medicament_seq'::regclass);
 G   ALTER TABLE public.medicament ALTER COLUMN id_medicament DROP DEFAULT;
       public          postgres    false    222    221            �           2604    16859    prescription id_prescription    DEFAULT     �   ALTER TABLE ONLY public.prescription ALTER COLUMN id_prescription SET DEFAULT nextval('public.prescription_id_prescription_seq'::regclass);
 K   ALTER TABLE public.prescription ALTER COLUMN id_prescription DROP DEFAULT;
       public          postgres    false    224    223            �           2604    16860    utilisateur id_utilisateur    DEFAULT     �   ALTER TABLE ONLY public.utilisateur ALTER COLUMN id_utilisateur SET DEFAULT nextval('public.utilisateur_id_utilisateur_seq'::regclass);
 I   ALTER TABLE public.utilisateur ALTER COLUMN id_utilisateur DROP DEFAULT;
       public          postgres    false    226    225            �           2604    16861    vente id_vente    DEFAULT     p   ALTER TABLE ONLY public.vente ALTER COLUMN id_vente SET DEFAULT nextval('public.vente_id_vente_seq'::regclass);
 =   ALTER TABLE public.vente ALTER COLUMN id_vente DROP DEFAULT;
       public          postgres    false    228    227            <          0    16815    commande 
   TABLE DATA           n   COPY public.commande (id_commande, date_commande, prix_total, id_fournisseur, prix_payer, statut) FROM stdin;
    public          postgres    false    214   �P       >          0    16819    fournisseur 
   TABLE DATA           l   COPY public.fournisseur (id_fournisseur, nom_fournisseur, adresse_fournisseur, tel_fournisseur) FROM stdin;
    public          postgres    false    216   ^Q       @          0    16825    lignecommande 
   TABLE DATA           V   COPY public.lignecommande (id_medicament, id_commande, qt_vente, qt_recu) FROM stdin;
    public          postgres    false    218   �Q       A          0    16828 
   lignevente 
   TABLE DATA           A   COPY public.lignevente (id_vente, id_medicament, qt) FROM stdin;
    public          postgres    false    219   2R       B          0    16831 	   listeprix 
   TABLE DATA           a   COPY public.listeprix (id_fournisseur, id_medicament, prix_unitaire, qt, prix_vente) FROM stdin;
    public          postgres    false    220   sR       C          0    16834 
   medicament 
   TABLE DATA           �   COPY public.medicament (id_medicament, nom_medicament, famille, ordonnance, prix_vente, qt_stock, qt_min, qt_max, seuil_commande, unite, id_fournisseur) FROM stdin;
    public          postgres    false    221   �R       E          0    16840    prescription 
   TABLE DATA           d   COPY public.prescription (id_prescription, nom_medecin, date_prescription, nom_patient) FROM stdin;
    public          postgres    false    223   �S       G          0    16846    utilisateur 
   TABLE DATA           �   COPY public.utilisateur (id_utilisateur, nom_utilisateur, prenom_utilisateur, annif_utilisateur, adresse_utilisateur, tel_utilisateur, identifiant, mot_de_passe, role, actif, bloquer) FROM stdin;
    public          postgres    false    225   T       I          0    16852    vente 
   TABLE DATA           Y   COPY public.vente (id_vente, date_vente, prix_total, payer, id_prescription) FROM stdin;
    public          postgres    false    227   �T       W           0    0    commande_id_commande_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.commande_id_commande_seq', 2, true);
          public          postgres    false    215            X           0    0    fournisseur_id_fournisseur_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.fournisseur_id_fournisseur_seq', 8, true);
          public          postgres    false    217            Y           0    0    medicament_id_medicament_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.medicament_id_medicament_seq', 5, true);
          public          postgres    false    222            Z           0    0     prescription_id_prescription_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.prescription_id_prescription_seq', 10, true);
          public          postgres    false    224            [           0    0    utilisateur_id_utilisateur_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.utilisateur_id_utilisateur_seq', 5, true);
          public          postgres    false    226            \           0    0    vente_id_vente_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.vente_id_vente_seq', 6, true);
          public          postgres    false    228            �           2606    16863    commande commande_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id_commande);
 @   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_pkey;
       public            postgres    false    214            �           2606    16865    fournisseur fournisseur_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.fournisseur
    ADD CONSTRAINT fournisseur_pkey PRIMARY KEY (id_fournisseur);
 F   ALTER TABLE ONLY public.fournisseur DROP CONSTRAINT fournisseur_pkey;
       public            postgres    false    216            �           2606    16867     lignecommande lignecommande_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.lignecommande
    ADD CONSTRAINT lignecommande_pkey PRIMARY KEY (id_medicament, id_commande);
 J   ALTER TABLE ONLY public.lignecommande DROP CONSTRAINT lignecommande_pkey;
       public            postgres    false    218    218            �           2606    16869    lignevente lignevente_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.lignevente
    ADD CONSTRAINT lignevente_pkey PRIMARY KEY (id_vente, id_medicament);
 D   ALTER TABLE ONLY public.lignevente DROP CONSTRAINT lignevente_pkey;
       public            postgres    false    219    219            �           2606    16871    listeprix listeprix_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.listeprix
    ADD CONSTRAINT listeprix_pkey PRIMARY KEY (id_fournisseur, id_medicament);
 B   ALTER TABLE ONLY public.listeprix DROP CONSTRAINT listeprix_pkey;
       public            postgres    false    220    220            �           2606    16873    medicament medicament_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.medicament
    ADD CONSTRAINT medicament_pkey PRIMARY KEY (id_medicament);
 D   ALTER TABLE ONLY public.medicament DROP CONSTRAINT medicament_pkey;
       public            postgres    false    221            �           2606    16875    prescription prescription_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.prescription
    ADD CONSTRAINT prescription_pkey PRIMARY KEY (id_prescription);
 H   ALTER TABLE ONLY public.prescription DROP CONSTRAINT prescription_pkey;
       public            postgres    false    223            �           2606    16877    utilisateur utilisateur_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id_utilisateur);
 F   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pkey;
       public            postgres    false    225            �           2606    16879    vente vente_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.vente
    ADD CONSTRAINT vente_pkey PRIMARY KEY (id_vente);
 :   ALTER TABLE ONLY public.vente DROP CONSTRAINT vente_pkey;
       public            postgres    false    227            �           2606    16880 %   commande commande_id_fournisseur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_fournisseur_fkey FOREIGN KEY (id_fournisseur) REFERENCES public.fournisseur(id_fournisseur);
 O   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_id_fournisseur_fkey;
       public          postgres    false    3222    214    216            �           2606    16885 ,   lignecommande lignecommande_id_commande_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lignecommande
    ADD CONSTRAINT lignecommande_id_commande_fkey FOREIGN KEY (id_commande) REFERENCES public.commande(id_commande);
 V   ALTER TABLE ONLY public.lignecommande DROP CONSTRAINT lignecommande_id_commande_fkey;
       public          postgres    false    3220    218    214            �           2606    16890 .   lignecommande lignecommande_id_medicament_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lignecommande
    ADD CONSTRAINT lignecommande_id_medicament_fkey FOREIGN KEY (id_medicament) REFERENCES public.medicament(id_medicament);
 X   ALTER TABLE ONLY public.lignecommande DROP CONSTRAINT lignecommande_id_medicament_fkey;
       public          postgres    false    3230    218    221            �           2606    16895 (   lignevente lignevente_id_medicament_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lignevente
    ADD CONSTRAINT lignevente_id_medicament_fkey FOREIGN KEY (id_medicament) REFERENCES public.medicament(id_medicament);
 R   ALTER TABLE ONLY public.lignevente DROP CONSTRAINT lignevente_id_medicament_fkey;
       public          postgres    false    221    3230    219            �           2606    16900 #   lignevente lignevente_id_vente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lignevente
    ADD CONSTRAINT lignevente_id_vente_fkey FOREIGN KEY (id_vente) REFERENCES public.vente(id_vente);
 M   ALTER TABLE ONLY public.lignevente DROP CONSTRAINT lignevente_id_vente_fkey;
       public          postgres    false    227    219    3236            �           2606    16905 '   listeprix listeprix_id_fournisseur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listeprix
    ADD CONSTRAINT listeprix_id_fournisseur_fkey FOREIGN KEY (id_fournisseur) REFERENCES public.fournisseur(id_fournisseur);
 Q   ALTER TABLE ONLY public.listeprix DROP CONSTRAINT listeprix_id_fournisseur_fkey;
       public          postgres    false    216    220    3222            �           2606    16910 &   listeprix listeprix_id_medicament_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listeprix
    ADD CONSTRAINT listeprix_id_medicament_fkey FOREIGN KEY (id_medicament) REFERENCES public.medicament(id_medicament);
 P   ALTER TABLE ONLY public.listeprix DROP CONSTRAINT listeprix_id_medicament_fkey;
       public          postgres    false    221    220    3230            �           2606    16915 )   medicament medicament_id_fournisseur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicament
    ADD CONSTRAINT medicament_id_fournisseur_fkey FOREIGN KEY (id_fournisseur) REFERENCES public.fournisseur(id_fournisseur);
 S   ALTER TABLE ONLY public.medicament DROP CONSTRAINT medicament_id_fournisseur_fkey;
       public          postgres    false    216    3222    221            �           2606    16920     vente vente_id_prescription_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vente
    ADD CONSTRAINT vente_id_prescription_fkey FOREIGN KEY (id_prescription) REFERENCES public.prescription(id_prescription);
 J   ALTER TABLE ONLY public.vente DROP CONSTRAINT vente_id_prescription_fkey;
       public          postgres    false    3232    227    223            <   U   x�3�4202�50�54�41�3�4�4�t�SH�/-*�2BHr�YZr!˛p��qpZ #	���Ԣ�̼�+S�b���� �#       >   �   x�U��
�0����)�	�$��eZ�RP\�	v
Yt���ע�����څKk��8�.��m$O��>��̟a�Ӌ�8Pô��5�Zc����\����/Ļ�̕A{v^E�d^��=�B8V�O¹�x��Ro\�0+      @   *   x�3�4�42�4�22�! �0�42 ,c0��b���� ���      A   1   x�3�4�4�bNC.# i�e�i�i�e
$�,��%P���qb���� �N�      B   =   x�5���@�j�0��.��P$rc�.ʚv.��aY!�����EIr�8���Iz��
�      C   �   x�M�M�0F�_O�	H �%����r3֊M
�Z��Kp1C2�Y̛�NH��H�wh�H������2�k�!9Dɡ8�~�D��6!v0��.L:M#6N�~�7PL�y�6,wIc��nr4�D���Q-��rIV����]j�bWfװmot�Ց������jM�kaK�ab��c_f(G�      E   w   x�3�t)�S��,��4202�50�50�t��LNU����+���2+���,8�򓸌9]��<��&����.�>>\&`	Y�#��,�����e`����e�sC������� �I%k      G   �   x���M
�@���^@q��g�W��n��:�D��7
�B�Hx��K
�h���T]�(ёҐ�"l��V
qxz���,t��
y���=ZfK��#tnz��(���[��(Θ7�/7�����%f�^'Q���'f�!�${Y�G-��:���Ah.����J����O�A�i^a      I   [   x�M��	�0Cѳ�K���%^���	�?Mi!�dp�VԋvXH&&��9�]��i+�X�N���G+��&sۺҔ\�����4x	�,     