CREATE TABLE Sucursal (
    ID_Sucursal INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Ubicación VARCHAR(255) NOT NULL
);


CREATE TABLE Empleado (
    ID_Empleado INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Rol VARCHAR(50) NOT NULL,
    ID_Sucursal INT,
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
);

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Rut_Cliente VARCHAR(13) NOT NULL
);

CREATE TABLE Hamburguesa (
    ID_Hamburguesa INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripción TEXT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Cliente INT,
    ID_Sucursal INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
);

CREATE TABLE DetallePedido (
    ID_DetallePedido INT PRIMARY KEY,
    ID_Pedido INT,
    ID_Hamburguesa INT,
    Cantidad INT NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Hamburguesa) REFERENCES Hamburguesa(ID_Hamburguesa)
);

CREATE TABLE Inventario (
    ID_Inventario INT PRIMARY KEY,
    ID_Sucursal INT,
    Ingrediente VARCHAR(100) NOT NULL,
    Cantidad INT NOT NULL,
    Fecha_Actualización DATE NOT NULL,
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
);

INSERT INTO Sucursal (ID_Sucursal, Nombre, Ubicación) VALUES
(1, 'Burger Town', 'Calle Vicuña Mackenna');

INSERT INTO Empleado (ID_Empleado, Nombre, Cargo, ID_Sucursal) VALUES
(1, 'Lucas', 'Gerente', 1),
(2, 'Pablo', 'Logística', 1),
(3, 'Ana', 'Cocinero', 1),
(4, 'Jorge', 'Camarero', 1);

INSERT INTO Cliente (ID_Cliente, Nombre, Rut_Cliente) VALUES
(1, 'Clara', '14.468.246-K'),
(2, 'Pedro','2.890.875-1');

INSERT INTO Hamburguesa (ID_Hamburguesa, Nombre, Descripción, Precio) VALUES
(1, 'Big Burger', 'Doble con queso, tocino, y salsa secreta', 15.000),
(2, 'Clásica', 'Con queso y lechuga', 8.000),
(3, 'MysteryBox', 'Ingredientes exóticos y sabores únicos', 12.000);

INSERT INTO Pedido (ID_Pedido, Fecha, ID_Cliente, ID_Sucursal) VALUES
(1, '2024-05-16', 1, 1),
(2, '2024-05-17', 2, 1);

INSERT INTO DetallePedido (ID_DetallePedido, ID_Pedido, ID_Hamburguesa, Cantidad) VALUES
(1, 1, 1, 2),
(2, 2, 3, 1);

INSERT INTO Inventario (ID_Inventario, ID_Sucursal, Ingrediente, Cantidad, Fecha_Actualización) VALUES
(1, 1, 'Queso', 50, '2024-05-16'),
(2, 1, 'Tocino', 30, '2024-05-16'),
(3, 1, 'Lechuga', 40, '2024-05-16'),
(4, 1, 'Salsa', 20, '2024-05-16');