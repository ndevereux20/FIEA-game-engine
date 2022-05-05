<?xml version="1.0"?><doc>
<members>
<member name="T:FieaGameEngine.JsonParseCoordinator" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="15">
<summary>
JsonParseCoordinator, controls the functionality of JsonParseHelpers. Finds an associated Helper that can handle the grammar of the Json.
Wraps JsonCpp functionality. 
</summary>
</member>
<member name="T:FieaGameEngine.JsonParseCoordinator.SharedData" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="24">
<summary>
SharedData class is a wrapper class. It represents all the data that the helpers share with each other and the JsonParseCoordinator
</summary>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.SharedData.GetJsonParseCoordinator" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="32">
<summary>
Defaulted Constructor.
</summary>
<summary>
Defaulted Destructor.
</summary>
<summary>
Defaulted Copy Constructor.
</summary>
<param name="other">The other SharedData.</param>
<summary>
Defaulted Copy Assignment.
</summary>
<param name="other">The other SharedData.</param>
<returns>The new SharedData.</returns>
<summary>
Default Move Constructor.
</summary>
<param name="other">The other SharedData.</param>
<summary>
Default Move Assignment. 
</summary>
<param name="other">The other SharedData.</param>
<returns>The new SharedData.</returns>
<summary>
Returns the JsonParseCoordinator associated with this SharedData.
</summary>
<returns>The JsonParseCoordinator.</returns>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.SharedData.GetJsonParseCoordinator" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="74">
<summary>
Returns the JsonParseCoordinator associated with this SharedData.
</summary>
<returns>The JsonParseCoordinator.</returns>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.SharedData.IncrementDepth" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="80">
<summary>
Increment the Depth of the SharedData.
</summary>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.SharedData.DecrementDepth" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="85">
<summary>
Decrements the Depth of the SharedData.
</summary>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.SharedData.Depth" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="90">
<summary>
Gets the Depth of the SharedData.
</summary>
<returns></returns>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.SharedData.Initialize" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="96">
<summary>
Initializes the SharedData. 
</summary>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.SharedData.Cleanup" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="101">
<summary>
Cleans up the SharedData.
</summary>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.SharedData.Create" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="106">
<summary>
Pure virtual Create function.
</summary>
<returns></returns>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.#ctor(FieaGameEngine.JsonParseCoordinator.SharedData*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="118">
<summary>
Constructor for JsonParseCoordinator that takes in the SharedData to associate with it.
</summary>
<param name="sharedData"></param>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.Dispose" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="124">
<summary>
Destructor for JsonParseCoordinator.
</summary>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.Clone" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="129">
<summary>
Clones this JsonParseCoordinator, The user is responsible for deleting the Cloned object.
</summary>
<returns>A pointer to a new JsonParseCoordinator.</returns>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.#ctor(FieaGameEngine.JsonParseCoordinator*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="137">
<summary>
Move Constructor for JsonParseCoordinator, expects no exceptions. 
</summary>
<param name="other">The other JsonParseCoordinator.</param>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.op_Assign(FieaGameEngine.JsonParseCoordinator*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="143">
<summary>
Move Assignment for JsonParseCoordinator, expects no exceptions.
</summary>
<param name="other">The other JsonParseCoordinator.</param>
<returns>A reference to the JsonParseCoordinator.</returns>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.Initialize" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="150">
<summary>
Initialize the JsonParseCoordinator.
</summary>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.AddHelper(FieaGameEngine.IJsonParseHelper*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="156">
<summary>
Adds a helper to the JsonParseCoordinator. Cannot do this if it is a Clone.
</summary>
<param name="helper">A reference to the Helper to add.</param>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.RemoveHelper(FieaGameEngine.IJsonParseHelper*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="162">
<summary>
Removes a helper from the JsonParseCoordinator. Cannot do this if it is a Clone.
</summary>
<param name="helper">A reference to the Helper to remove.</param>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.Parse(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="168">
<summary>
Parses a string in Json format.
</summary>
<param name="jsonString">The Json string to Parse.</param>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.ParseFromFile(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="174">
<summary>
Parses a Json file.
</summary>
<param name="filename">The file to Parse.</param>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.Parse(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="180">
<summary>
Parses an istream in Json format.
</summary>
<param name="jsonStream">The Json istream to Parse.</param>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.SetSharedData(FieaGameEngine.JsonParseCoordinator.SharedData*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="186">
<summary>
Sets the SharedData for the JsonParseCoordinator.
</summary>
<param name="sharedData">The SharedData to set.</param>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.GetSharedData" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="192">
<summary>
Gets the SharedData associated with this JsonParseCoordinator.
</summary>
<returns>A pointer to the SharedData.</returns>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.GetSharedData" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="198">
<summary>
Gets the SharedData associated with this JsonParseCoordinator.
</summary>
<returns>A pointer to the SharedData.</returns>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.IsClone" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="204">
<summary>
Asks whether the JsonParseCoordinator is a clone or not.
</summary>
<returns>A bool as to whether the JsonParseCoordinator is a clone.</returns>
</member>
<member name="M:FieaGameEngine.JsonParseCoordinator.Helpers" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonParseCoordinator.h" line="210">
<summary>
Gets the Vector of Helpers associated with this JsonParseCoordinator.
</summary>
<returns>A constant reference to the Vector Helper pointers.</returns>
</member>
<member name="T:FieaGameEngine.IJsonParseHelper" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\IJsonParseHelper.h" line="8">
<summary>
Pure Virtual abstract base class for JsonParseHelpers.
</summary>
</member>
<member name="M:FieaGameEngine.IJsonParseHelper.Create" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\IJsonParseHelper.h" line="15">
<summary>
Default Constructor for IJsonParseHelper.
</summary>
<summary>
Default Destructor for IJsonParseHelper.
</summary>
<summary>
Default Copy Constructor for IJsonParseHelper.
</summary>
<param name="other">The other IJsonParseHelper.</param>
<summary>
Default Copy Assignment for IJsonParseHelper.
</summary>
<param name="other">The other IJsonParseHelper.</param>
<returns>A reference to the new IJsonParseHelper.</returns>
<summary>
Default Move Constructor for IJsonParseHelper.
</summary>
<param name="other">The other IJsonParseHelper.</param>
<summary>
Default Move Assignment for IJsonParseHelper.
</summary>
<param name="other">The other IJsonParseHelper.</param>
<returns>A reference to the new IJsonParseHelper.</returns>
<summary>
Pure Virtual Create, creates a new IJsonParseHelper.
</summary>
<returns></returns>
</member>
<member name="M:FieaGameEngine.IJsonParseHelper.Initialize" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\IJsonParseHelper.h" line="57">
<summary>
Initializes the IJsonParseHelper.
</summary>
</member>
<member name="M:FieaGameEngine.IJsonParseHelper.StartHandler(FieaGameEngine.JsonParseCoordinator.SharedData*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt64!System.Runtime.CompilerServices.IsConst)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\IJsonParseHelper.h" line="64">
<summary>
Pure Virtual StartHandler call, starts the Handler.
</summary>
<param name="sharedData">A reference to the SharedData.</param>
<param name="key">The key to add as the Scope. This is associated with JsonValue.</param>
<param name="value">A reference to the JsonValue object that we are adding to a Scope.</param>
<returns>A bool as to wheter the StartHandler was called.</returns>
</member>
<member name="M:FieaGameEngine.IJsonParseHelper.EndHandler(FieaGameEngine.JsonParseCoordinator.SharedData*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\IJsonParseHelper.h" line="73">
<summary>
Pure Virtual EndHandler call, ends the Handler.
</summary>
<param name="sharedData">A reference to the SharedData.</param>
<param name="key">The key associated with the JsonValue.</param>
<returns>A bool as to whether the EndHandler was called.</returns>
</member>
</members>
</doc>