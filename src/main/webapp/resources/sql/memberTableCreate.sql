CREATE TABLE member(
    m_loginId VARCHAR(10) NOT NULL,
    m_name VARCHAR(20),
    m_password VARCHAR(20),
    m_phone1 VARCHAR(3),
    m_phone2 VARCHAR(4),
    m_phone3 VARCHAR(4),
    m_fileName VARCHAR(50),
    m_activityType VARCHAR(10),
    PRIMARY KEY (m_loginId)
);
