package net.andrews.BackEnd.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages = {"net.andrews.BackEnd.dto"})
@EnableTransactionManagement
public class HibernateConfig {

	// DataBase Details
	private final static String DATABASE_URL = "jdbc:h2:tcp://localhost/~/ECommerce";
	private final static String DATABASE_DRIVER = "org.h2.Driver";
	private final static String DATABASE_DIALECT = "org.hibernate.dialect.H2Dialect";
	private final static String DATABASE_USERNAME = "andrews";
	private final static String DATABASE_PASSWORD = "";

	// Datasource bean Will Be Available
	@Bean
	public DataSource getDataSource() {

		BasicDataSource dataSource = new BasicDataSource();

		// Providing Database Connection Information
		dataSource.setDriverClassName(DATABASE_DRIVER);
		dataSource.setUrl(DATABASE_URL);
		dataSource.setUsername(DATABASE_USERNAME);
		dataSource.setPassword(DATABASE_PASSWORD);

		return dataSource;
	}
	// SessionFactory bean Will Be Available

	@Bean
	public SessionFactory getSessionFactory(DataSource dataSource) {
	LocalSessionFactoryBuilder builder=new LocalSessionFactoryBuilder(dataSource);
		
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("net.andrews.BackEnd.dto");
		
		
		
		return builder.buildSessionFactory();
	}
	
	//All The Hibernate Properties will be returned in this Method
	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", DATABASE_DIALECT);
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
		
		return properties;
	}
	
	//TransactionManager Bean
	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
    HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
		
		
		
		
	}

	
}
