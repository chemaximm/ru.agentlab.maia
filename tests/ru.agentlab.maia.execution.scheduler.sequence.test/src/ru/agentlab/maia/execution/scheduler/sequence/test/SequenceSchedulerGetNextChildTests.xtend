package ru.agentlab.maia.execution.scheduler.sequence.test

import java.util.Collections
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Spy
import org.mockito.runners.MockitoJUnitRunner
import ru.agentlab.maia.execution.scheduler.sequence.SequenceContextScheduler
import ru.agentlab.maia.execution.tree.IExecutionScheduler

import static org.hamcrest.Matchers.*
import static org.junit.Assert.*
import static org.mockito.Mockito.*

@RunWith(MockitoJUnitRunner)
class SequenceSchedulerGetNextChildTests {

	extension SequenceSchedulerTestsExtension = new SequenceSchedulerTestsExtension

	@Spy
	IExecutionScheduler scheduler = new SequenceContextScheduler

	@Test
	def void silenceOnEmptyQueue() {
		val childs = Collections.EMPTY_LIST
		when(scheduler.childs).thenReturn(childs)
		assertThat(scheduler.childs, emptyIterable)

		val next = scheduler.nextChild

		assertThat(next, nullValue)
	}

	@Test
	def void beginFromFirst() {
		val size = 10
		val childs = getFakeChilds(size)
		when(scheduler.childs).thenReturn(childs)
		assertThat(scheduler.childs, not(emptyIterable))

		val next = scheduler.nextChild

		assertThat(next, equalTo(childs.get(0)))
	}

	@Test
	def void changeCurrenChild() {
		val size = 10
		val childs = getFakeChilds(size)
		when(scheduler.childs).thenReturn(childs)
		assertThat(scheduler.childs, not(emptyIterable))

		for (i : 0 ..< 10) {
			val next = scheduler.nextChild
			val current = scheduler.currentChild

			assertThat(next, equalTo(current))
		}
	}

	@Test
	def void overloadRestartFromBegin() {
		val size = 10
		val childs = getFakeChilds(size)
		when(scheduler.childs).thenReturn(childs)
		assertThat(scheduler.childs, not(emptyIterable))

		for (i : 0 ..< size * 3) {
			val next = scheduler.nextChild
			if (i % size == 0) {
				assertThat(next, equalTo(childs.get(0)))
			}
		}
	}

	@Test
	def void returnChildsInOrder() {
		val size = 10
		val childs = getFakeChilds(size)
		when(scheduler.childs).thenReturn(childs)
		assertThat(scheduler.childs, not(emptyIterable))

		for (i : 0 ..< size) {
			val next = scheduler.nextChild

			assertThat(next, equalTo(childs.get(i)))
		}
	}

}