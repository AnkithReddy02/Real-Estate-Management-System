use realstate;
CREATE TABLE `agents` (
  `agent_id` int(11) NOT NULL,
  `agent_name` varchar(40) DEFAULT NULL,
  `Contact_Number` varchar(40) DEFAULT NULL,
  `agent_password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`agent_id`, `agent_name`, `Contact_Number`, `agent_password`) VALUES
(382500, 'Satya Pujari', '9879645632', 'Z258DYCIB'),
(382501, 'Aditya Mukund', '7077834987', 'O7MBDMN5I'),
(382502, 'Raunak Jaiswal', '9098794356', 'R2P1UQVWM'),
(382503, 'Aryan Sivansh', '8796596546', '3BZN22W0Z'),
(382504, 'Satyam Kasyap', '9787695435', 'N0VXU2KDV'),
(382505, 'Anupam Biswas', '9347567893', 'VJSZ6QTL'),
(382506, 'Abhisekh Lima', '8764593287', '97YT0900P'),
(382507, 'Subhasis Patnaik', '7437568923', '6IOMSSQI'),
(382508, 'Ladi Sailesh', '7659248675', '4TD7IPRC4'),
(382509, 'Mohit Yadav', '9345786123', '9QLHBW884');

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `Buyer_Id` int(11) NOT NULL,
  `Buyer_name` varchar(40) DEFAULT NULL,
  `Contact_Number` varchar(40) DEFAULT NULL,
  `buyer_password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`Buyer_Id`, `Buyer_name`, `Contact_Number`, `buyer_password`) VALUES
(282803, 'John', '9594885103', 'NMW9EW149'),
(282804, 'Richard', '9326304291', 'OB8ZXCP8P'),
(282806, 'Robert Brown', '8927221123 ', 'KHC1W2DB6'),
(282809, 'Patricia Jones', '9303388189', 'QQ9RSC342'),
(282810, 'Regina Reed', '7287558478', 'OXCMTUK16'),
(282811, 'Walter Mitchell', '8095286191', 'FB21RFJ6X'),
(282812, 'ANkithjsdbf', '9441333234', 'registerasofnow'),
(282818, 'Random Guy', '9435678345', 'V74R55Z5J'),
(282819, 'jhsdkfj', '9441333594', 'XSUM82B24'),
(282820, 'ANkithReddy', '9441333594', '65WT2NPCA'),
(282821, 'Rajini Thala', '9441333594', '5K2B3TZ6'),
(282825, 'Arthur Kim', '6902942001', 'arthurKim@#$\'\''),
(282826, 'Dfc', '4563278903', '35322rdf'),
(282827, 'Hey', '7013302371', 'Boom Booom'),
(282828, 'Veeru', '7013302371', '12345678'),
(282829, 'Hii', '9573084644', 'Anvesh@23289'),
(282830, 'Veeru', '9999999999', 'Veeranjineyulu'),
(282831, 'mani', '6546516511', '6546516511'),
(282832, 'asjsndjkn', '3456712901', '12345678'),
(282833, 'asdfgcagvb', '1122334455', 'qvse231v'),
(282834, 'Kaushik Sir', '1234554321', 'ighjg1234ds'),
(282835, 'haha', '3456781209', '3456781209');

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `house_id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `street_name` varchar(40) DEFAULT NULL,
  `apt_no` varchar(40) DEFAULT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `rent_price` int(11) DEFAULT NULL,
  `sale_status` varchar(40) DEFAULT NULL,
  `rent_status` varchar(40) DEFAULT NULL,
  `no_bedrooms` int(11) DEFAULT NULL,
  `specificatons` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`house_id`, `agent_id`, `seller_id`, `city`, `street_name`, `apt_no`, `sale_price`, `rent_price`, `sale_status`, `rent_status`, `no_bedrooms`, `specificatons`) VALUES
(1, 382501, 499999, 'Visakhapatnam', 'Akkayyapalem', '23-14A', 3500000, NULL, 'N', NULL, 3, '2500 sq.ft'),
(2, 382502, 499998, 'Visakhapatnam', 'Simhachalam', '14-16B', 2500000, 10000, 'N', 'N', 2, '1327 sq.ft'),
(3, 382502, 499997, 'Srikakulam', 'Meher Nager', '23-15B', NULL, 15000, NULL, 'Y', 2, '1800 sq.ft'),
(4, 382503, 499998, 'Anakapalle', 'Devi Nagar', '14-10D', 3000000, 18000, 'Y', 'N', 2, '1787 sq.ft'),
(5, 382500, 500001, 'Visakhapatnam', 'Gajuwaka', '15-12A', 2850000, NULL, 'Y', NULL, 2, '1600 sq.ft'),
(6, 382501, 500000, 'Visakhapatnam', 'Siripuram', '17-13D', 4500000, 21000, 'Y', 'N', 3, '3000 sq.ft'),
(7, 382505, 500003, 'Warangal', 'Waddepally', '2-10-309', 260000, 10000, 'N', 'N', 2, '2348 sq.ft'),
(8, 382502, 500000, 'Visakhapatnam', 'Maddilapalem', '14-13B', 2800000, NULL, 'N', NULL, 4, '3500 sq.ft'),
(9, 382506, 499999, 'Vijayanagaram', 'Dharmapuri', '12-13C', 3200000, 10000, 'N', 'Y', 2, '1200 sq.ft'),
(10, 382505, 500005, 'Vijayanagaram', 'Thotapalem', '13-9D', 3000000, 12000, 'N', 'N', 3, '2500 sq.ft'),
(11, 382507, 499999, 'Visakhapatnam', 'Gurudwara', '12-10A', NULL, 9000, NULL, 'Y', 3, '2320 sq.ft'),
(12, 382508, 499997, 'Visakhapatnam', 'Beach Road', '9-14B', 3500000, NULL, 'Y', NULL, 4, '3700 sq.ft');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `transaction_id` int(11) NOT NULL,
  `house_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `leaving_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`transaction_id`, `house_id`, `buyer_id`, `purchase_date`, `leaving_date`) VALUES
(342419, 3, 282806, '2020-08-03', '2020-10-03'),
(342420, 4, 282811, '2019-05-13', '0000-00-00'),
(342421, 5, 282803, '2021-01-24', '0000-00-00'),
(342422, 6, 282804, '2019-01-31', '0000-00-00'),
(342423, 9, 282809, '2020-10-14', '2020-11-14'),
(342424, 11, 282809, '2020-11-10', NULL),
(342425, 12, 282810, '2021-02-17', '0000-00-00'),
(342426, 3, 282811, '2020-11-07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(40) DEFAULT NULL,
  `Contact_Number` varchar(40) DEFAULT NULL,
  `seller_password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_id`, `seller_name`, `Contact_Number`, `seller_password`) VALUES
(499997, 'Nicolas Goodwin', '9332510245', 'Y95QUT677'),
(499998, 'Lake Mees', '8241054031', '5UIRWWKVD'),
(499999, 'Kelvin Hicks', '7891562488', 'X97XTXXLT'),
(500000, 'Julio Parker', '6341028416', '2NO7QR9RO'),
(500001, 'Jeff Todd', '9440375041', 'UYYLV772D'),
(500003, 'Nora Owen', '9441333549', 'HXXKT2J76'),
(500005, 'Brandy Nash', '9989245278', 'XU75TD2ZD'),
(500006, 'Johnnie Thornton', '9939491592', 'NUY0X84NJ'),
(500009, 'Joy Marsh', '8934120911', 'Joy@Joy96'),
(500010, 'Uttam', '7876543543', 'uttam123'),
(500011, 'Mandeep', '7894365432', 'mandeep123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`agent_id`),
  ADD UNIQUE KEY `agent_name` (`agent_name`,`Contact_Number`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`Buyer_Id`),
  ADD UNIQUE KEY `Buyer_name` (`Buyer_name`,`Contact_Number`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`house_id`),
  ADD UNIQUE KEY `city` (`city`,`street_name`,`apt_no`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `house_id` (`house_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `seller_name` (`seller_name`,`Contact_Number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382510;
--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `Buyer_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282836;
--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `house_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342427;
--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500012;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `house`
--
ALTER TABLE `house`
  ADD CONSTRAINT `house_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`),
  ADD CONSTRAINT `house_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`agent_id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house` (`house_id`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`Buyer_Id`);
COMMIT;
