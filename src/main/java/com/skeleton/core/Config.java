package com.skeleton.core;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Properties;
import java.util.logging.Logger;

public class Config {

    private static final Logger LOG = Logger.getLogger(AuthFilter.class.getSimpleName());

    public static String getProperty(String property) {
        return getProperties().getProperty(property);
    }

    public static Properties getProperties() {
        Properties properties = new Properties();
        URL resource = Config.class.getResource("/skeleton.properties");
        File propertiesFile = new File("./src/main/resources/skeleton.properties");
        try {
            propertiesFile = new File(resource.toURI());
        } catch (URISyntaxException e) {
            LOG.info(e.toString());
            LOG.info("Using default source path.");
        }
        try {
            FileInputStream stream = new FileInputStream(propertiesFile);
            properties.load(stream);
        } catch (IOException ioe) {
            LOG.info(ioe.toString());
        }
        return properties;
    }
}
