#[derive(Clone, PartialEq, Eq, Debug)]
pub enum LogLevel {
    Info,
    Warning,
    Error,
    #[cfg(feature = "add-a-variant")]
    Debug,
}

pub fn log(level: LogLevel, message: &str) -> String {
    let level_str = match level {
        LogLevel::Info => "INFO",
        LogLevel::Warning => "WARNING",
        LogLevel::Error => "ERROR",
        #[cfg(feature = "add-a-variant")]
        LogLevel::Debug => "DEBUG",
    };

    format!("[{}]: {}", level_str, message).to_string()
}

pub fn info(message: &str) -> String {
    log(LogLevel::Info, message)
}

pub fn warn(message: &str) -> String {
    log(LogLevel::Warning, message)
}

pub fn error(message: &str) -> String {
    log(LogLevel::Error, message)
}
