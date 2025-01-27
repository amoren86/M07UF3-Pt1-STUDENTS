--
-- Table structure for table `students`
--
CREATE TABLE IF NOT EXISTS students(
                  `dni` VARCHAR(9) NOT NULL,
                  `name` VARCHAR(200) NOT NULL,
                  `surname`  VARCHAR(200) NOT NULL,
                  `email` VARCHAR(200) DEFAULT NULL,
                  PRIMARY KEY (`dni`)
);

--
-- Table structure for table `cycles`
--
CREATE TABLE IF NOT EXISTS cycles(
                  `code` VARCHAR(10) NOT NULL,
                  `name`VARCHAR(255) NOT NULL,
                  PRIMARY KEY (`code`)
);

--
-- Table structure for table `modules`
--
CREATE TABLE IF NOT EXISTS modules(
                  `code` VARCHAR(10) NOT NULL,
                  `cycle_code`VARCHAR(10) NOT NULL,
                  `name`VARCHAR(255) NOT NULL,
                  PRIMARY KEY (`code`, `cycle_code`),
                  KEY `fk_cycle_code`(`cycle_code`)
);

--
-- Table structure for table `modules_students`
--
CREATE TABLE IF NOT EXISTS modules_students(
                  `module_code` VARCHAR(10) NOT NULL,
                  `module_cycle_code` VARCHAR(10) NOT NULL,
                  `student_dni` VARCHAR(200) NOT NULL,
                  PRIMARY KEY (`module_code`, `module_cycle_code`, `student_dni`),
                  KEY `fk_module_code_module_cycle_code` (`module_code`, `module_cycle_code`),
                  KEY `fk_student_dni` (`student_dni`)
);

--
-- Constraints for table `modules_students`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `fk_cycle_code` FOREIGN KEY (`cycle_code`) REFERENCES `cycles` (`code`);
  
--
-- Constraints for table `modules_students`
--
ALTER TABLE `modules_students`
  ADD CONSTRAINT `fk_module_code_module_cycle_code` FOREIGN KEY (`module_code`, `module_cycle_code`) REFERENCES `modules` (`code`, `cycle_code`),
  ADD CONSTRAINT `fk_student_dni` FOREIGN KEY (`student_dni`) REFERENCES `students` (`dni`);