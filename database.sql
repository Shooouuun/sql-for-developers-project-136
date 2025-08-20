-- Таблица программ обучения
CREATE TABLE programs (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    program_type TEXT NOT NULL, -- например: интенсив, профессия
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- Таблица модулей
CREATE TABLE modules (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- Таблица курсов
CREATE TABLE courses (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- Таблица уроков
CREATE TABLE lessons (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    content TEXT,
    video_url TEXT,
    position INT NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE NOT NULL,
    course_id BIGINT NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- Связь многие-ко-многим: модули <-> курсы
CREATE TABLE modules_courses (
    module_id BIGINT NOT NULL REFERENCES modules(id) ON DELETE CASCADE,
    course_id BIGINT NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    PRIMARY KEY (module_id, course_id)
);

-- Связь многие-ко-многим: программы <-> модули
CREATE TABLE programs_modules (
    program_id BIGINT NOT NULL REFERENCES programs(id) ON DELETE CASCADE,
    module_id BIGINT NOT NULL REFERENCES modules(id) ON DELETE CASCADE,
    PRIMARY KEY (program_id, module_id)
);
