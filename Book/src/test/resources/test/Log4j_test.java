package cosmo.book.controller;

import org.apache.log4j.Logger;

import lombok.extern.log4j.Log4j;

@Log4j
public class Log4j_test {
	
private Logger logger = Logger.getLogger(Log4j_test.class);
    
    public void userLogger() {
        logger.trace("trace");
        logger.debug("debug");
        logger.info("info");
        logger.warn("warn");
        logger.error("error");
        logger.fatal("fatal");

    }
}
