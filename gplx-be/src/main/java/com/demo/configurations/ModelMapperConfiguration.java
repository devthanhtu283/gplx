package com.demo.configurations;

import com.demo.dtos.TestDTO;
import com.demo.entities.Test;
import org.modelmapper.ModelMapper;

import org.modelmapper.PropertyMap;
import org.modelmapper.TypeMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
public class ModelMapperConfiguration {
    @Autowired
    private Environment environment;

    @Bean
    public ModelMapper modelMapper() {
        ModelMapper mapper = new ModelMapper();
        mapper.addMappings(new PropertyMap<Test, TestDTO>() {
            @Override
            protected void configure() {
                // Bỏ qua mặc định, xử lý riêng bằng converter ở dưới
                using(ctx -> {
                    Test source = (Test) ctx.getSource();
                    if (source.getTestDetails() == null) {
                        return 0;
                    } else {
                        return source.getTestDetails().size();
                    }
                }).map(source, destination.getNumberOfQuestion());
            }
        });
        return mapper;
    }
}