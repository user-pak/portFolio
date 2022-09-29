DROP DATABASE IF EXISTS PORTFOLIO_COPY;
CREATE DATABASE IF NOT EXISTS PORTFOLIO_COPY DEFAULT CHARACTER SET UTF8MB4;
USE PORTFOLIO_COPY;
CREATE TABLE MEMBER (ID VARCHAR(20) UNIQUE NOT NULL, NAME VARCHAR(20) NOT NULL, PASSWORD VARCHAR(100) NOT NULL, EMAIL VARCHAR(255), PHONE VARCHAR(20), M_STATUS CHAR(2) DEFAULT 'Y', CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, ADDRESS VARCHAR(50));
CREATE TABLE DEPARTMENT (DEPT_ID CHAR(4) PRIMARY KEY, DEPT_TITLE VARCHAR(30) NOT NULL);
CREATE TABLE JOB (JOB_CODE CHAR(4) PRIMARY KEY, JOB_NAME VARCHAR(30) NOT NULL);
CREATE TABLE SAL_GRADE (SAL_LEVEL CHAR(4) PRIMARY KEY, MIN_SAL INT(11) NOT NULL, MAX_SAL INT(11) NOT NULL ,SAL_NAME  VARCHAR(10) NOT NULL);
CREATE TABLE EMPLOYEE (EMP_NO INT(11) PRIMARY KEY AUTO_INCREMENT, DEPT_CODE CHAR(4), JOB_CODE CHAR(4), SAL_LEVEL CHAR(4), SALARY INT(11), BONUS INT(11), MANAGER_ID VARCHAR(20), HIRE_DATE VARCHAR(20), ENT_DATE DATETIME, ENT_YN CHAR(2) DEFAULT 'N', MEMBER_ID VARCHAR(20) NOT NULL, CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY(DEPT_CODE) REFERENCES DEPARTMENT(DEPT_ID) ON DELETE SET NULL, FOREIGN KEY(JOB_CODE) REFERENCES JOB(JOB_CODE) ON DELETE SET NULL, FOREIGN KEY(SAL_LEVEL) REFERENCES SAL_GRADE(SAL_LEVEL) ON DELETE SET NULL);
CREATE TABLE BOARD (B_NO INT(11) PRIMARY KEY AUTO_INCREMENT, B_TITLE VARCHAR(255), B_AUTHOR VARCHAR(20) NOT NULL, B_COUNT INT(11) DEFAULT 0, B_CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, B_STATUS CHAR(2) DEFAULT 'Y', B_CONTENT VARCHAR(255));
CREATE TABLE REPLY (R_NO INT(11) PRIMARY KEY AUTO_INCREMENT, REF_BNO INT(11), R_AUTHOR VARCHAR(20), R_CONTENT VARCHAR(255), R_CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, R_STATUS CHAR(2) DEFAULT 'Y', CHECK_YN CHAR(2) DEFAULT 'N');
CREATE TABLE TB_WISH_BOOK (W_NO INT(11) PRIMARY KEY AUTO_INCREMENT, W_PUBLISHER VARCHAR(20), W_AUTHOR VARCHAR(20), W_BOOK_TITLE VARCHAR(100), USER_ID VARCHAR(20) NOT NULL, W_CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE TB_RENT (RENT_NO INT(11) PRIMARY KEY AUTO_INCREMENT, RENT_BOOK_NO INT(11) NOT NULL, RENT_MEMBER_ID VARCHAR(20) NOT NULL, RENT_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, RETURN_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, RETURN_CK INT(11) DEFAULT 0);
CREATE TABLE TB_MAIN_CATEGORY (MAIN_CAT_NO VARCHAR(10) PRIMARY KEY, MAIN_CAT_NAME VARCHAR(20) NOT NULL);
CREATE TABLE TB_SUB_CATEGORY (SUB_CAT_NO VARCHAR(10) PRIMARY KEY, SUB_CAT_NAME VARCHAR(20) NOT NULL, MAIN_CAT_NO VARCHAR(10) NOT NULL, FOREIGN KEY(MAIN_CAT_NO) REFERENCES TB_MAIN_CATEGORY(MAIN_CAT_NO) ON DELETE CASCADE);
CREATE TABLE TB_PUBLISHER (PUB_NO INT(11) PRIMARY KEY AUTO_INCREMENT, PUB_NAME VARCHAR(20) NOT NULL, PHONE VARCHAR(20), DEAL_YN CHAR(2) DEFAULT 'Y', PUB_STATUS CHAR(2) DEFAULT 'Y', CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE TB_BOOK (BK_NO INT(11) PRIMARY KEY AUTO_INCREMENT, BK_TITLE VARCHAR(20) NOT NULL, BK_AUTHOR VARCHAR(20) NOT NULL, BK_PUB_NO INT(11), MAINCTG VARCHAR(10), SUBCTG VARCHAR(10), ISSUE_DATE VARCHAR(20), ORIGINAL_FILENAME VARCHAR(20), RENAME_FILENAME VARCHAR(255), CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, B_STATUS CHAR(2) DEFAULT 'Y', RENT_COUNT INT(11) DEFAULT 0, RENT_YN CHAR(2) DEFAULT 'Y', FOREIGN KEY(MAINCTG) REFERENCES TB_MAIN_CATEGORY(MAIN_CAT_NO) ON DELETE SET NULL);
CREATE TABLE TB_NOTICE (NOTICE_NO INT(11) PRIMARY KEY AUTO_INCREMENT, NOTICE_TITLE VARCHAR(20), NOTICE_CATEGORY VARCHAR(20), CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, NOTICE_STATUS CHAR(2) DEFAULT 'Y', CONTENT VARCHAR(255));
delimiter |
CREATE TRIGGER RENT_TRG AFTER INSERT ON TB_RENT FOR EACH ROW BEGIN UPDATE TB_BOOK SET RENT_COUNT = RENT_COUNT + 1 WHERE BK_NO = NEW.RENT_BOOK_NO; END|
CREATE TRIGGER RENT_N_TRG AFTER INSERT ON TB_RENT FOR EACH ROW BEGIN UPDATE TB_BOOK SET RENT_YN = 'N' WHERE NEW.RENT_BOOK_NO = BK_NO; END|
CREATE TRIGGER RETN_Y_TRG AFTER UPDATE ON TB_RENT FOR EACH ROW BEGIN UPDATE TB_BOOK SET RENT_YN = 'Y' WHERE BK_NO = NEW.RENT_BOOK_NO; END|
delimiter ;