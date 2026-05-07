-- Database: uniport_db

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL UNIQUE,
  `role` enum('Super Admin','Admin') DEFAULT 'Admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `buses` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_name` varchar(100) NOT NULL,
  `bus_number` varchar(30) NOT NULL UNIQUE,
  `company_name` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL,
  `bus_type` enum('AC','Non-AC') NOT NULL,
  `facilities` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `passengers` (
  `passenger_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT 'Male',
  `phone` varchar(20) NOT NULL UNIQUE,
  `email` varchar(100) DEFAULT NULL UNIQUE,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_city` varchar(100) NOT NULL,
  `destination_city` varchar(100) NOT NULL,
  `distance_km` int(11) NOT NULL,
  `estimated_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  UNIQUE KEY `source_destination` (`source_city`,`destination_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `travel_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `fare` decimal(10,2) NOT NULL,
  `boarding_point` varchar(100) NOT NULL,
  `dropping_point` varchar(100) NOT NULL,
  `schedule_status` enum('Available','Closed','Cancelled') DEFAULT 'Available',
  PRIMARY KEY (`schedule_id`),
  FOREIGN KEY (`bus_id`) REFERENCES `buses`(`bus_id`) ON UPDATE CASCADE,
  FOREIGN KEY (`route_id`) REFERENCES `routes`(`route_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- admins
INSERT INTO `admins` (`admin_id`, `full_name`, `username`, `password`, `email`, `role`) VALUES
(1, 'System Administrator', 'admin', 'admin123', 'admin@uniport.com', 'Super Admin'),
(2, 'Counter Manager', 'counter', 'counter123', 'counter@uniport.com', 'Admin');

-- buses
INSERT INTO `buses` (`bus_id`, `bus_name`, `bus_number`, `company_name`, `capacity`, `bus_type`, `facilities`, `status`) VALUES
(1, 'Uniport Express', 'UP-DHK-101', 'Uniport Travels', 40, 'AC', 'WiFi, Charging Port, Water Bottle', 'Active'),
(2, 'City Cruiser', 'UP-DHK-102', 'City Line', 36, 'AC', 'Recliner Seat, Charging Port', 'Active'),
(3, 'SafeWay Transport', 'UP-DHK-103', 'SafeWay Paribahan', 45, 'Non-AC', 'Comfort Seat, Fan', 'Active'),
(4, 'Road Star Luxury', 'UP-DHK-104', 'Road Star', 32, 'AC', 'Sleeper Seat, WiFi, Blanket', 'Active'),
(5, 'Green Line Special', 'UP-DHK-105', 'Green Line', 40, 'AC', 'Recliner Seat, TV, Water Bottle', 'Active'),
(6, 'Hanif Classic', 'UP-DHK-106', 'Hanif Enterprise', 45, 'Non-AC', 'Comfort Seat, Fan', 'Active'),
(7, 'Ena Super', 'UP-DHK-107', 'Ena Transport', 42, 'Non-AC', 'Comfort Seat', 'Active'),
(8, 'Shohagh Elite', 'UP-DHK-108', 'Shohagh Paribahan', 36, 'AC', 'WiFi, Charging Port', 'Active'),
(9, 'Nabil Comfort', 'UP-DHK-109', 'Nabil Paribahan', 40, 'AC', 'Recliner Seat, Water Bottle', 'Active'),
(10, 'Star Line Basic', 'UP-DHK-110', 'Star Line', 45, 'Non-AC', 'Normal Seat, Fan', 'Active');

-- passengers
INSERT INTO `passengers` (`passenger_id`, `full_name`, `gender`, `phone`, `email`, `address`) VALUES
(1, 'Rakib Hasan', 'Male', '01712345678', 'rakib@example.com', 'Mirpur, Dhaka'),
(2, 'Nusrat Jahan', 'Female', '01812345678', 'nusrat@example.com', 'Uttara, Dhaka'),
(3, 'Mahib Ullah', 'Male', '01912345678', 'mahib@example.com', 'Dhanmondi, Dhaka'),
(4, 'Ifrat Jahan', 'Female', '01612345678', 'ifrat@example.com', 'Mohammadpur, Dhaka'),
(5, 'Farhan Masrib', 'Male', '01512345678', 'farhan@example.com', 'Banani, Dhaka'),
(6, 'Shoreful Hassan', 'Male', '01312345678', 'shoreful@example.com', 'Savar, Dhaka'),
(7, 'Sadia Akter', 'Female', '01412345678', 'sadia@example.com', 'Sylhet Sadar'),
(8, 'Tanvir Ahmed', 'Male', '01798765432', 'tanvir@example.com', 'Rangpur Sadar'),
(9, 'Mim Akter', 'Female', '01898765432', 'mim@example.com', 'Chittagong'),
(10, 'Arif Hossain', 'Male', '01998765432', 'arif@example.com', 'Bogura'),
(11, 'Jannatul Ferdous', 'Female', '01698765432', 'jannatul@example.com', 'Rajshahi'),
(12, 'Sakib Islam', 'Male', '01598765432', 'sakib@example.com', 'Khulna');

-- routes
INSERT INTO `routes` (`route_id`, `source_city`, `destination_city`, `distance_km`, `estimated_time`) VALUES
(1, 'Dhaka', 'Rangpur', 310, '7 Hours'),
(2, 'Dhaka', 'Chittagong', 265, '6 Hours'),
(3, 'Rangpur', 'Dhaka', 310, '7 Hours'),
(4, 'Dhaka', 'Sylhet', 240, '5 Hours'),
(5, 'Sylhet', 'Dhaka', 240, '5 Hours'),
(6, 'Dhaka', 'Rajshahi', 245, '6 Hours'),
(7, 'Rajshahi', 'Dhaka', 245, '6 Hours'),
(8, 'Dhaka', 'Coxs Bazar', 390, '10 Hours'),
(9, 'Chittagong', 'Dhaka', 265, '6 Hours'),
(10, 'Dhaka', 'Bogura', 200, '5 Hours'),
(11, 'Bogura', 'Dhaka', 200, '5 Hours'),
(12, 'Dhaka', 'Khulna', 270, '7 Hours'),
(13, 'Khulna', 'Dhaka', 270, '7 Hours'),
(14, 'Mymensingh', 'Dhaka', 120, '3 Hours'),
(15, 'Dhaka', 'Mymensingh', 120, '3 Hours');

-- schedules
INSERT INTO `schedules`
(`schedule_id`, `bus_id`, `route_id`, `travel_date`, `departure_time`, `arrival_time`, `fare`, `boarding_point`, `dropping_point`, `schedule_status`) VALUES
(1, 1, 1, '2026-05-20', '08:00:00', '15:00:00', 750.00, 'Gabtoli Bus Terminal', 'Rangpur Central Bus Terminal', 'Available'),
(2, 2, 1, '2026-05-20', '10:30:00', '17:30:00', 800.00, 'Kallyanpur Counter', 'Rangpur Central Bus Terminal', 'Available'),
(3, 3, 2, '2026-05-20', '13:15:00', '19:15:00', 600.00, 'Sayedabad Bus Terminal', 'Chittagong Bus Terminal', 'Available'),
(4, 4, 3, '2026-05-20', '20:00:00', '03:00:00', 1200.00, 'Rangpur Central Bus Terminal', 'Gabtoli Bus Terminal', 'Available'),
(5, 5, 4, '2026-05-20', '07:30:00', '12:30:00', 700.00, 'Mohakhali Bus Terminal', 'Sylhet Central Terminal', 'Available');