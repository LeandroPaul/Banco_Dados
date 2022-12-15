-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Dez-2022 às 04:14
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aplicações_bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `Nome` varchar(50) NOT NULL,
  `Sigla` char(5) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `Coordenador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`Nome`, `Sigla`, `Codigo`, `Coordenador`) VALUES
('Tec. Telemática', 'DTT', 121, 121031),
('Tec. Construção de Edificios', 'DCE', 122, 122047),
('Eng. Computação', 'DEC', 125, 125331);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--

CREATE TABLE `dependente` (
  `Matric_Prof` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `RG` int(11) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `DataNasc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `Matric_Prof` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `Nome` varchar(50) NOT NULL,
  `Snome` varchar(50) NOT NULL,
  `Matricula` int(11) NOT NULL,
  `DataNasc` date NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Salario` decimal(6,2) NOT NULL,
  `Matric_Rep_Area` int(11) DEFAULT NULL,
  `Depto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`Nome`, `Snome`, `Matricula`, `DataNasc`, `Sexo`, `Salario`, `Matric_Rep_Area`, `Depto`) VALUES
('Pedro', 'Pereira da Silva', 121003, '1982-03-25', 'M', '4000.00', NULL, 121),
('José Maria', 'Campos', 121031, '1978-04-10', 'M', '7000.00', 121003, 121),
('Bento', 'Diniz Costa', 122045, '1980-11-27', 'M', '4000.00', NULL, 122),
('Ana Clara', 'Araújo Santos', 122047, '1994-12-30', 'F', '7200.00', 122045, 122),
('Maria Luiza', 'Machado', 125331, '1974-08-16', 'F', '6800.00', 125332, 125),
('Joana Maria', 'Campos Pereira', 125332, '1990-06-12', 'F', '4500.00', NULL, 125),
('João Carlos', 'Matos Cavalcanti', 125335, '1976-07-22', 'M', '3700.00', 125332, 125);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `Nome` varchar(80) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `Depto` int(11) NOT NULL,
  `Duração` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `Coordenador` (`Coordenador`);

--
-- Índices para tabela `dependente`
--
ALTER TABLE `dependente`
  ADD PRIMARY KEY (`Matric_Prof`,`RG`),
  ADD UNIQUE KEY `RG` (`RG`);

--
-- Índices para tabela `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`Matric_Prof`,`Email`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`Matricula`),
  ADD KEY `Depto` (`Depto`);

--
-- Índices para tabela `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `Depto` (`Depto`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`Coordenador`) REFERENCES `professor` (`Matricula`);

--
-- Limitadores para a tabela `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`Matric_Prof`) REFERENCES `professor` (`Matricula`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Codigo`);

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
