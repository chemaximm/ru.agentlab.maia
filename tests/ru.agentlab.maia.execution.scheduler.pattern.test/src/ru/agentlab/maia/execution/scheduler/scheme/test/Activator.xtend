package ru.agentlab.maia.execution.scheduler.scheme.test

import org.junit.runner.JUnitCore
import org.junit.runner.Result
import org.junit.runner.notification.Failure
import org.junit.runner.notification.RunListener
import org.osgi.framework.BundleActivator
import org.osgi.framework.BundleContext

class Activator implements BundleActivator {
	
	package static BundleContext context
	
	@Override
	override void start(BundleContext context) throws Exception {
		Activator.context = context;
		new JUnitCore() => [
			addListener(new RunListener() {

				override testFailure(Failure failure) throws Exception {
					println(failure.message)
					println(failure.trace)
				}

				override testRunFinished(Result result) throws Exception {
					result => [
						if (wasSuccessful) {
							println("SUCCESSFULL")
						} else {
							println("FAIL")
							println(failureCount)
						}
					]
				}

			})
			run(SchemeSchedulerTests)
		]
	}

	@Override
	override void stop(BundleContext context) throws Exception {
		Activator.context = null
	}

}