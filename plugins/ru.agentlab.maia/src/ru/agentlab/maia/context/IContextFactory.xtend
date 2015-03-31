package ru.agentlab.maia.context

import org.eclipse.e4.core.contexts.IEclipseContext
import ru.agentlab.maia.naming.INameGenerator

/**
 * <p>Factory for creating Contexts.</p>
 * <p>Contexts represent platform, container, agent and behaviour objects. Context 
 * can contain layer-specific services for injection.</p> 
 * 
 * @author <a href='shishkin_dimon@gmail.com'>Shishkin Dmitriy</a> - Initial contribution.
 */
interface IContextFactory {

	/**
	 * Key for store context name
	 */
	val static String KEY_NAME = "context.name"

	/**
	 * Key for store context type
	 */
	val static String KEY_TYPE = "context.type"

	/**
	 * Key for store list of platforms in context
	 */
	val static String KEY_PLATFORMS = "context.platforms"

	/**
	 * Key for store list of containers in context
	 */
	val static String KEY_CONTAINERS = "context.containers"

	/**
	 * Key for store list of agents in context
	 */
	val static String KEY_AGENTS = "context.agents"

	/**
	 * Key for store list of behaviours in context
	 */
	val static String KEY_BEHAVIOURS = "context.behaviours"
	
	/**
	 * Id indicated that context is a platform
	 */
	val static String TYPE_PLATFORM = "ru.agentlab.maia.platform"

	/**
	 * Id indicated that context is a container
	 */
	val static String TYPE_CONTAINER = "ru.agentlab.maia.container"
	
	/**
	 * Id indicated that context is a agent
	 */
	val static String TYPE_AGENT = "ru.agentlab.maia.agent"

	/**
	 * Id indicated that context is a behaviour
	 */
	val static String TYPE_BEHAVIOUR = "ru.agentlab.maia.behaviour"

	/**
	 * Create Context with default set of services. Set of services depends of
	 * implementation
	 * @param root - parent context where platform will be created
	 * @param id - unique id of context. If <code>null</code>, then some implementation of 
	 * {@link INameGenerator INameGenerator} will be used for 
	 * generating context name.
	 * @return Context with default set of services
	 */
	def IEclipseContext createDefault(String id)

	/**
	 * Create Context without any additional services
	 * @param root - parent context where platform will be created
	 * @param id - unique id of context. If <code>null</code>, then some implementation of 
	 * {@link INameGenerator INameGenerator} will be used for 
	 * generating context name.
	 * @return Context without any additional services
	 */
	def IEclipseContext createEmpty(String id)

}