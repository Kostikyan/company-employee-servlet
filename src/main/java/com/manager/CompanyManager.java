package com.manager;



import com.db.DBConnectionProvider;
import com.model.Company;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompanyManager {
    
    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void save(Company company) {
        String sql = "INSERT INTO `company_employee`.`company`(`name`,`country`) VALUES(?,?)";

        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, company.getName());
            ps.setString(2, company.getCountry());
            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if(generatedKeys.next()) {
                company.setId(generatedKeys.getInt(1));
            }
            System.out.println("Company inserted into DB");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Company getById(int id) {
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("Select * from `company_employee`.`company` where `id` = " + id);
            if (resultSet.next()) {
                return getCompanyFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Company> getAll() {
        List<Company> companyList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("Select * from `company_employee`.`company`");
            while (resultSet.next()) {
                companyList.add(getCompanyFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companyList;
    }

    public List<Company> getByCountry(String country) {
        List<Company> companyList = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement("Select * from `company_employee`.`company` where `country` = ?");
            ps.setString(1, country);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                companyList.add(getCompanyFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companyList;
    }

    private Company getCompanyFromResultSet(ResultSet resultSet) throws SQLException {
        Company company = new Company();
        company.setId(resultSet.getInt("id"));
        company.setName(resultSet.getString("name"));
        company.setCountry(resultSet.getString("country"));
        return company;
    }

    public void removeById(int companyId) {
        String sql = "DELETE FROM `company_employee`.`company` WHERE `id` = " + companyId;
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void update(Company company) {
        String sql = "UPDATE `company_employee`.`company` SET `name` = '%s', `country` = '%s' WHERE `id` = %d";
        try(Statement statement = connection.createStatement()){
            statement.executeUpdate(String.format(sql, company.getName(), company.getCountry(), company.getId()));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
