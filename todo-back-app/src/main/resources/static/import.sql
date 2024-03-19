DROP TABLE IF EXISTS "clients";
CREATE TABLE "public"."clients" (
                                    "email" character varying(255),
                                    "id" character varying(255) NOT NULL,
                                    "lastname" character varying(255),
                                    "name" character varying(255),
                                    "password" character varying(255),
                                    "username" character varying(255),
                                    CONSTRAINT "clients_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "clients_roles";
CREATE TABLE "public"."clients_roles" (
                                          "client_id" character varying(255) NOT NULL,
                                          "role_id" character varying(255) NOT NULL,
                                          CONSTRAINT "clients_roles_client_id_role_id_key" UNIQUE ("client_id", "role_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "roles";
CREATE TABLE "public"."roles" (
                                  "id" character varying(255) NOT NULL,
                                  "role_name" character varying(255),
                                  CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."clients_roles" ADD CONSTRAINT "fkdfc8skx88ssraasvuujbk3kex" FOREIGN KEY (client_id) REFERENCES clients(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."clients_roles" ADD CONSTRAINT "fko54trdcx32s4eolcxktnjpc3a" FOREIGN KEY (role_id) REFERENCES roles(id) NOT DEFERRABLE;
