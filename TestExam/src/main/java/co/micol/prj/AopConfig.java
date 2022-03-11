package co.micol.prj;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import co.micol.prj.aop.LogAspect;

@Configuration //spring IoC -> 컨테이너에 등록해야 할 애들 설정
@EnableAspectJAutoProxy
@Component
public class AopConfig {
	@Bean
	LogAspect logAspect() {
		return new LogAspect();
	}

}
