use ai_caller;

-- Call Session Table

CREATE TABLE candidates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    phone VARCHAR(20),
    experience VARCHAR(50),
    current_salary VARCHAR(100),
    expected_salary VARCHAR(100),
    notice_period VARCHAR(100),
    city VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Call Session Table

CREATE TABLE call_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT,
    call_status VARCHAR(50),
    started_at DATETIME,
    ended_at DATETIME,
    summary TEXT,
    FOREIGN KEY (candidate_id)
    REFERENCES candidates(id)
);

-- Conversation Logs

CREATE TABLE conversation_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT,
    speaker ENUM('AI','USER'),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id)
    REFERENCES call_sessions(id)
);

-- Recruiter Questions

CREATE TABLE interview_questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT,
    field_name VARCHAR(100),
    order_no INT
);

INSERT INTO interview_questions
(question, field_name, order_no)
VALUES
('How many years of Python experience do you have?', 'experience', 1),
('What is your current salary?', 'current_salary', 2),
('Expected salary?', 'expected_salary', 3),
('What is your notice period?', 'notice_period', 4);