<?xml version="1.0"?><doc>
<members>
<member name="T:FieaGameEngine.EventSubscriber" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventSubscriber.h" line="6">
<summary>
Pure-virtual base class for a subscriber, has an overridable notify method, that must be implemented in any
class you want to make a subscriber
</summary>
</member>
<member name="M:FieaGameEngine.EventSubscriber.Notify(FieaGameEngine.EventPublisher!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventSubscriber.h" line="21">
<summary>
Does whatever work is needed in the subscriber.
</summary>
<param name="eventPublisher">The publisher of that notifies the subscriber, use the RTTI system to verify 
you are recieving the right message.</param>
</member>
<member name="T:FieaGameEngine.EventPublisher" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventPublisher.h" line="11">
<summary>
Base class for Event, Delivers the message of an event to all subscribers.
</summary>
</member>
<member name="M:FieaGameEngine.EventPublisher.Deliver" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventPublisher.h" line="24">
<summary>
Delivers the message of the event of type T, to all of its subscribers. 
</summary>
</member>
<member name="T:FieaGameEngine.EventInfo" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventQueue.h" line="7">
<summary>
Holds info for each event pushed into the Queue, The time the event was queued, and the the delay to wait for unqueueing.
</summary>
</member>
<member name="M:FieaGameEngine.EventQueue.Enqueue(std.shared_ptr&lt;FieaGameEngine.EventPublisher&gt;,FieaGameEngine.GameTime*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.chrono.duration&lt;System.Int64,std.ratio&lt;0x01,0x03e8&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventQueue.h" line="24">
<summary>
Enqueue an event with an optional delay to wait before publishing 
</summary>
<param name="eventPublisher">A shared_ptr to an eventPublisher base class.</param>
<param name="gameTime">The GameTime.</param>
<param name="timeDelay">Delay to wait before Delivering the event.</param>
</member>
<member name="M:FieaGameEngine.EventQueue.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventQueue.h" line="32">
<summary>
Delivers all events message if they are expired.
</summary>
<param name="gameTime">The GameTime.</param>
</member>
<member name="M:FieaGameEngine.EventQueue.Clear" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventQueue.h" line="38">
<summary>
Clears the Queue.
</summary>
</member>
<member name="M:FieaGameEngine.EventQueue.IsEmpty" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventQueue.h" line="43">
<summary>
Queuries if the Queue is empty.
</summary>
<returns>Bool as to whether the Queue is empty.</returns>
</member>
<member name="M:FieaGameEngine.EventQueue.Size" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\EventQueue.h" line="49">
<summary>
Gets the size of the Queue.
</summary>
<returns>The size of the Queue.</returns>
</member>
</members>
</doc>