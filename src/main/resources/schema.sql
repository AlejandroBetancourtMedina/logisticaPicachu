CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

create table IF NOT EXISTS cliente(
rut VARCHAR(20) PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
ap_paterno VARCHAR(20) NOT NULL,
ap_materno VARCHAR(20) NOT NULL,
domicilio VARCHAR(20) NOT NULL,
region VARCHAR(20) NOT NULL,
comuna VARCHAR(20) NOT NULL,
email VARCHAR(20) NOT NULL
);

create table IF NOT EXISTS telefono(
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
telefono NUMERIC(10) NOT NULL,
cliente_id VARCHAR REFERENCES cliente(rut)
);

create table IF NOT EXISTS tipo_vehiculo(
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
tipo_vehiculo VARCHAR(20) NOT NULL,
descripcion VARCHAR(50)
);

create table IF NOT EXISTS sucursales(
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
nombre_sucursal VARCHAR(20) NOT NULL,
direccion VARCHAR(20) NOT NULL,
region VARCHAR(20) NOT NULL,
comuna VARCHAR(20) NOT NULL,
empleado_id VARCHAR(20),
tipo_empleado_id UUID
);

-- Incorporo FK sucursales

ALTER TABLE sucursales
    ADD CONSTRAINT fk_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(rut),
    ADD CONSTRAINT fk_tipo_empleado FOREIGN KEY (tipo_empleado_id) REFERENCES tipo_empleado(id);


create table IF NOT EXISTS empleado(
rut VARCHAR(20) PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
ap_paterno VARCHAR(20) NOT NULL,
ap_materno VARCHAR(20) NOT NULL,
telefono NUMERIC(10) NOT NULL,
email VARCHAR(20) NOT NULL,
activo BOOLEAN,
sucursal_id UUID
);

-- Incorporo FK empelado
ALTER TABLE empleado
     ADD CONSTRAINT fk_sucursales FOREIGN KEY (sucursal_id) REFERENCES sucursales(id);


create table IF NOT EXISTS vehiculo(
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
patente VARCHAR(6) NOT NULL,
marca VARCHAR(20) NOT NULL,
año NUMERIC(4) NOT NULL,
modelo VARCHAR(20) NOT NULL,
altura_max NUMERIC(6),
ancho_max NUMERIC(6),
capacidad_max NUMERIC(6),
fecha_venc_revis_tecnica TIMESTAMP,
fecha_venc_seguro_automotriz TIMESTAMP,
fecha_venc_perm_circulacion TIMESTAMP,
activo BOOLEAN,
empleado_id VARCHAR REFERENCES empleado(rut),
tipo_vehiculo_id UUID REFERENCES tipo_vehiculo(id)
);


create table IF NOT EXISTS producto(
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
nombre_producto VARCHAR(20) NOT NULL,
cantidad NUMERIC(10) NOT NULL,
descripcion VARCHAR(30) NOT NULL,
precio_declarado NUMERIC(10) NOT NULL,
peso_producto NUMERIC(10) NOT NULL,
ancho_producto NUMERIC(10) NOT NULL,
espesor_producto NUMERIC (10) NOT NULL,
desc_producto NUMERIC(10),
fecha_registro TIMESTAMP,
estado_encomienda VARCHAR(20),
despacho_id UUID
 );

-- Incorporo FK producto
ALTER TABLE producto
    ADD CONSTRAINT fk_producto FOREIGN KEY (despacho_id) REFERENCES despacho(id);

 create table IF NOT EXISTS destinatario(
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
nombre VARCHAR(20) NULL,
ap_paterno VARCHAR(20) NULL,
ap_materno VARCHAR(20) NULL,
correo VARCHAR(20) NULL,
telefono NUMERIC(10) NOT NULL,
domicilio VARCHAR(20) NOT NULL,
despacho_id UUID
 );

-- Incorporo FK destinatario
ALTER TABLE destinatario
    ADD CONSTRAINT fk_destinatario FOREIGN KEY (despacho_id) REFERENCES despacho(id);


 create table IF NOT EXISTS despacho(
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
fecha_emision TIMESTAMP,
pagado_por_pagar BOOLEAN,
cliente_id VARCHAR REFERENCES cliente(rut),
destinatario_id UUID REFERENCES destinatario(id),
producto_id UUID REFERENCES producto(id),
vehiculo_id UUID REFERENCES vehiculo(id),
sucursales_id UUID REFERENCES sucursales(id)
 );

create table IF NOT EXISTS tipo_empleado(
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
gerente BOOLEAN,
supervisor BOOLEAN,
conductor BOOLEAN,
empleado_id VARCHAR (20)
);

-- Incorporo FK para tipo_empleado
ALTER TABLE tipo_empleado
    ADD CONSTRAINT fk_tipo_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(rut);

 create table IF NOT EXISTS licencia(
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
tipo_licencia VARCHAR(20) NOT NULL,
vencimiento_licencia DATE,
tipo_empleado_id UUID REFERENCES tipo_empleado(id)
 );
