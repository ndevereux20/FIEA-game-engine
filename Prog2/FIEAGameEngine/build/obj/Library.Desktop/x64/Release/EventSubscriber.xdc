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
</members>
</doc>