CREATE TABLE IF NOT EXISTS `onlineQuiz`.`av_topic` (
  `topic` VARCHAR(200) NOT NULL,
  `sub_topic` VARCHAR(250) NOT NULL,
  `username` VARCHAR(40) NULL,
  `email_id` VARCHAR(40) NULL,
  PRIMARY KEY (`sub_topic`),
  INDEX `fk_av_topic_1_idx` (`username` ASC, `email_id` ASC),
  CONSTRAINT `fk_av_topic_1`
    FOREIGN KEY (`username` , `email_id`)
    REFERENCES `onlineQuiz`.`av_user` (`username` , `email_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `onlineQuiz`.`av_question_bank` (
  `question_no` INT NOT NULL,
  `sub_topic` VARCHAR(250) NOT NULL,
  `question` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`sub_topic`, `question_no`),
  CONSTRAINT `fk_av_question_bank_1`
    FOREIGN KEY (`sub_topic`)
    REFERENCES `onlineQuiz`.`av_topic` (`sub_topic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE  `onlineQuiz`.`av_answer_key` (
  `seqnum` INT NOT NULL AUTO_INCREMENT,
  `question_no` INT ,
  `sub_topic` VARCHAR(250),
  `answers` VARCHAR(100) NOT NULL,
  `correct_opt_flg` TINYINT(1) NOT NULL,
  PRIMARY KEY (`seqnum`),
    CONSTRAINT `fk_av_answer_key_1`
    FOREIGN KEY (`question_no` , `sub_topic`)
    REFERENCES `onlineQuiz`.`av_question_bank` (`question_no` , `sub_topic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
CREATE TABLE IF NOT EXISTS `onlineQuiz`.`av_user` (
  `username` VARCHAR(40) NOT NULL,
  `first_name` VARCHAR(40) NOT NULL,
  `last_name` VARCHAR(40) NULL,
  `pwd` VARCHAR(20) NOT NULL,
  `email_id` VARCHAR(40) NOT NULL,
  `qualification` VARCHAR(50) NULL,
  `occupation` VARCHAR(50) NULL,
  PRIMARY KEY (`username`, `email_id`))
COMMENT = 'Used to store the user information.';


CREATE TABLE IF NOT EXISTS `onlineQuiz`.`av_answer_key` (
  `seqnum` INT NOT NULL AUTO_INCREMENT,
  `question_no` INT NOT NULL,
  `sub_topic` VARCHAR(250) NOT NULL,
  `answers` VARCHAR(100) NOT NULL,
  `correct_opt_flg` TINYINT(1) NOT NULL,
  PRIMARY KEY (`seqnum`),
  INDEX `fk_av_answer_key_1_idx` (`sub_topic` ASC, `question_no` ASC),
  CONSTRAINT `fk_av_answer_key_1`
    FOREIGN KEY (`sub_topic` , `question_no`)
    REFERENCES `onlineQuiz`.`av_question_bank` (`sub_topic` , `question_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
