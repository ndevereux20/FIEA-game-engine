<?xml version="1.0"?><doc>
<members>
<member name="T:Microsoft.VisualStudio.CppUnitTestFramework.Logger" decl="false" source="C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\VS\UnitTest\include\CppUnitTestLogger.h" line="17">
Logger
</member>
<member name="T:Json.Features" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\json_features.h" line="17">
\brief Configuration passed to reader and writer.
 * This configuration object can be used to force the Reader or Writer
 * to behave in a standard conforming way.

</member>
<!-- Discarding badly formed XML document comment for member 'M:Json.Features.all'. -->
<member name="M:Json.Features.strictMode" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\json_features.h" line="31">
\brief A configuration that is strictly compatible with the JSON
   * specification.
   * - Comments are forbidden.
   * - Root object must be either an array or an object value.
   * - Assumes Value strings are encoded in UTF-8

</member>
<member name="M:Json.Features.#ctor" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\json_features.h" line="39">
\brief Initialize the configuration like JsonConfig::allFeatures;

</member>
<member name="F:Json.Features.allowComments_" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\json_features.h" line="43">
\c true if comments are allowed. Default: \c true.
</member>
<member name="F:Json.Features.strictRoot_" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\json_features.h" line="46">
\c true if root must be either an array or an object value. Default: \c
false.
</member>
<member name="F:Json.Features.allowDroppedNullPlaceholders_" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\json_features.h" line="50">
\c true if dropped null placeholders are allowed. Default: \c false.
</member>
<member name="F:Json.Features.allowNumericKeys_" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\json_features.h" line="53">
\c true if numeric object key are allowed. Default: \c false.
</member>
<member name="T:Json.Exception" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="63">
Base class for all exceptions we throw.
 *
 * We use nothing but these internally. Of course, STL can throw others.

</member>
<member name="T:Json.RuntimeError" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="77">
Exceptions which the user cannot easily avoid.
 *
 * E.g. out-of-memory (when we use malloc), stack-overflow, malicious input
 *
 * \remark derived from Json::Exception

</member>
<member name="T:Json.LogicError" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="88">
Exceptions thrown by JSON_ASSERT/JSON_FAIL macros.
 *
 * These are precondition-violations (user bugs) and internal errors (our bugs).
 *
 * \remark derived from Json::Exception

</member>
<member name="M:Json.throwRuntimeError(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="100">
used internally
</member>
<member name="M:Json.throwLogicError(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="102">
used internally
</member>
<member name="T:Json.ValueType" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="105">
\brief Type of the value held by a Value object.

</member>
<member name="F:numberOfCommentPlacement" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="122">
root value)
</member>
<member name="T:Json.PrecisionType" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="126">
\brief Type of precision for formatting of real values.

</member>
<member name="T:Json.StaticString" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="133">
\brief Lightweight wrapper to tag static string.
 *
 * Value constructor and objectValue member assignment takes advantage of the
 * StaticString and avoid the cost of string duplication when storing the
 * string or the member name.
 *
 * Example of usage:
 * \code
 * Json::Value aValue( StaticString("some text") );
 * Json::Value object;
 * static const StaticString code("code");
 * object[code] = 1234;
 * \endcode

</member>
<!-- Discarding badly formed XML document comment for member 'T:Json.Value'. -->
<member name="F:Json.Value.minLargestInt" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="222">
Minimum signed integer value that can be stored in a Json::Value.
</member>
<member name="F:Json.Value.maxLargestInt" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="225">
Maximum signed integer value that can be stored in a Json::Value.
</member>
<member name="F:Json.Value.maxLargestUInt" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="227">
Maximum unsigned integer value that can be stored in a Json::Value.
</member>
<member name="F:Json.Value.minInt" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="230">
Minimum signed int value that can be stored in a Json::Value.
</member>
<member name="F:Json.Value.maxInt" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="232">
Maximum signed int value that can be stored in a Json::Value.
</member>
<member name="F:Json.Value.maxUInt" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="234">
Maximum unsigned int value that can be stored in a Json::Value.
</member>
<member name="F:Json.Value.minInt64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="238">
Minimum signed 64 bits int value that can be stored in a Json::Value.
</member>
<member name="F:Json.Value.maxInt64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="240">
Maximum signed 64 bits int value that can be stored in a Json::Value.
</member>
<member name="F:Json.Value.maxUInt64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="242">
Maximum unsigned 64 bits int value that can be stored in a Json::Value.
</member>
<member name="F:Json.Value.defaultRealPrecision" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="245">
Default precision for real value for string representation.
</member>
<member name="M:Json.Value.#ctor(Json.ValueType)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="299">
 \brief Create a default Value of the given type.

 This is a very useful constructor.
 To create an empty array, pass arrayValue.
 To create an empty object, pass objectValue.
 Another Value can then be set to this one by assignment.
 This is useful since clear() and resize() will not alter types.

 Examples:
   \code
   Json::Value null_value; // null
   Json::Value arr_value(Json::arrayValue); // []
   Json::Value obj_value(Json::objectValue); // {}
   \endcode

</member>
<member name="M:Json.Value.#ctor(Json.StaticString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="325">
 \brief Constructs a value from a static string.

 Like other value string constructor but do not duplicate the string for
 internal storage. The given string must remain alive after the call to
 this constructor.

 \note This works only for null-terminated strings. (We cannot change the
 size of this class, so we have nowhere to store the length, which might be
 computed later for various operations.)

 Example of usage:
   \code
   static StaticString foo("some text");
   Json::Value aValue(foo);
   \endcode

</member>
<member name="M:Json.Value.op_Assign(Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="350">
\note Overwrite existing comments. To preserve comments, use
#swapPayload().
</member>
<member name="M:Json.Value.swap(Json.Value*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="355">
Swap everything.
</member>
<member name="M:Json.Value.swapPayload(Json.Value*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="357">
Swap values but leave comments and source offsets in place.
</member>
<member name="M:Json.Value.copy(Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="360">
copy everything.
</member>
<member name="M:Json.Value.copyPayload(Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="362">
copy values but leave comments and source offsets in place.
</member>
<member name="M:Json.Value.op_LessThan(Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="367">
Compare payload only, not comments etc.
</member>
<member name="M:Json.Value.getString(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst**,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst**)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="382">
Get raw char* of string-value.
   *  \return false if !string. (Seg-fault if str or end are NULL.)

</member>
<member name="M:Json.Value.size" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="417">
Number of values in array or object
</member>
<member name="M:Json.Value.empty" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="420">
\brief Return true if empty array, empty object, or null;
otherwise, false.
</member>
<member name="M:Json.Value.op_Explicit~System.Boolean" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="424">
Return !isNull()
</member>
<member name="M:Json.Value.clear" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="427">
Remove all object members and array elements.
\pre type() is arrayValue, objectValue, or nullValue
\post type() is unchanged
</member>
<member name="M:Json.Value.resize(System.UInt32)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="432">
Resize the array to newSize elements.
New elements are initialized to null.
May only be called on nullValue or arrayValue.
\pre type() is arrayValue or nullValue
\post type() is arrayValue
</member>
<member name="M:Json.Value.op_Subscript(System.UInt32)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="440">
Access an array element (zero based index). If the array contains less
than index element, then null value are inserted in the array so that
its size is index+1.
(You may need to say 'value[0u]' to get your compiler to distinguish
this from the operator[] which takes a string.)
</member>
<member name="M:Json.Value.op_Subscript(System.UInt32)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="450">
Access an array element (zero based index).
(You may need to say 'value[0u]' to get your compiler to distinguish
this from the operator[] which takes a string.)
</member>
<member name="M:Json.Value.get(System.UInt32,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="457">
If the array contains at least index+1 elements, returns the element
value, otherwise returns defaultValue.
</member>
<!-- Discarding badly formed XML document comment for member 'M:Json.Value.isValidIndex(System.UInt32)'. -->
<member name="M:Json.Value.append(Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="462">
\brief Append value to array at the end.

Equivalent to jsonvalue[jsonvalue.size()] = value;
</member>
<member name="M:Json.Value.insert(System.UInt32,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="468">
\brief Insert value in array at specific index
</member>
<member name="M:Json.Value.op_Subscript(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="472">
Access an object value by name, create a null member if it does not exist.
\note Because of our implementation, keys are limited to 2^30 -1 chars.
Exceeding that will cause an exception.
</member>
<member name="M:Json.Value.op_Subscript(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="476">
Access an object value by name, returns null if there is no member with
that name.
</member>
<member name="M:Json.Value.op_Subscript(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="479">
Access an object value by name, create a null member if it does not exist.
\param key may contain embedded nulls.
</member>
<member name="M:Json.Value.op_Subscript(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="482">
Access an object value by name, returns null if there is no member with
that name.
\param key may contain embedded nulls.
</member>
<member name="M:Json.Value.op_Subscript(Json.StaticString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="486">
\brief Access an object value by name, create a null member if it does not
   * exist.
   *
   * If the object has no entry for that name, then the member name used to
   * store the new entry is not duplicated.
   * Example of use:
   *   \code
   *   Json::Value object;
   *   static const StaticString code("code");
   *   object[code] = 1234;
   *   \endcode

</member>
<member name="M:Json.Value.get(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="499">
Return the member named key if it exist, defaultValue otherwise.
\note deep copy
</member>
<member name="M:Json.Value.get(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="502">
Return the member named key if it exist, defaultValue otherwise.
\note deep copy
\note key may contain embedded nulls.
</member>
<member name="M:Json.Value.get(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="507">
Return the member named key if it exist, defaultValue otherwise.
\note deep copy
\param key may contain embedded nulls.
</member>
<member name="M:Json.Value.find(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="511">
Most general and efficient version of isMember()const, get()const,
and operator[]const
\note As stated elsewhere, behavior is undefined if (end-begin) &gt;= 2^30
</member>
<member name="M:Json.Value.demand(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="515">
Most general and efficient version of object-mutators.
\note As stated elsewhere, behavior is undefined if (end-begin) &gt;= 2^30
\return non-zero, but JSON_ASSERT if this is neither object nor nullValue.
</member>
<member name="M:Json.Value.removeMember(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="519">
\brief Remove and return the named member.

Do nothing if it did not exist.
\pre type() is objectValue or nullValue
\post type() is unchanged
</member>
<member name="M:Json.Value.removeMember(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="525">
Same as removeMember(const char*)
\param key may contain embedded nulls.
</member>
<member name="M:Json.Value.removeMember(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,Json.Value*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="528">
Same as removeMember(const char* begin, const char* end, Value* removed),
but 'key' is null-terminated.
</member>
<member name="M:Json.Value.removeMember(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="531">
\brief Remove the named map member.
   *
   *  Update 'removed' iff removed.
   *  \param key may contain embedded nulls.
   *  \return true iff removed (no exceptions)

</member>
<!-- Discarding badly formed XML document comment for member 'M:Json.Value.removeMember(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,Json.Value*)'. -->
<member name="M:Json.Value.removeIndex(System.UInt32,Json.Value*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="540">
\brief Remove the indexed array element.
   *
   *  O(n) expensive operations.
   *  Update 'removed' iff removed.
   *  \return true if removed (no exceptions)

</member>
<member name="M:Json.Value.isMember(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="548">
Return true if the object has a member named key.
\note 'key' must be null-terminated.
</member>
<member name="M:Json.Value.isMember(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="551">
Return true if the object has a member named key.
\param key may contain embedded nulls.
</member>
<!-- Discarding badly formed XML document comment for member 'M:Json.Value.isMember(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)'. -->
<member name="M:Json.Value.getMemberNames" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="557">
\brief Return a list of the member names.

If null, return an empty list.
\pre type() is objectValue or nullValue
\post if type() was nullValue, it remains nullValue
</member>
<member name="M:Json.Value.setComment(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,Json.CommentPlacement)" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="564">
\deprecated Always pass len.
</member>
<member name="M:Json.Value.setComment(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt64,Json.CommentPlacement)" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="569">
Comments must be //... or /* ... */
</member>
<member name="M:Json.Value.setComment(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,Json.CommentPlacement)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="573">
Comments must be //... or /* ... */
</member>
<member name="M:Json.Value.getComment(Json.CommentPlacement)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="576">
Include delimiters and embedded newlines.
</member>
<member name="T:Json.PathArgument" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="687">
\brief Experimental and untested: represents an element of the "path" to
 * access a node.

</member>
<member name="T:Json.Path" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="706">
\brief Experimental and untested: represents a "path" to access a node.
 *
 * Syntax:
 * - "." =&gt; root node
 * - ".[n]" =&gt; elements at index 'n' of root node (an array value)
 * - ".name" =&gt; member named 'name' of root node (an object value)
 * - ".name1.name2.name3"
 * - ".[0][1][2].name1[3]"
 * - ".%" =&gt; member name is provided as parameter
 * - ".[%]" =&gt; index is provided as parameter

</member>
<member name="M:Json.Path.make(Json.Value*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="727">
Creates the "path" to access the specified node and returns a reference on
the node.
</member>
<member name="T:Json.ValueIteratorBase" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="743">
\brief base class for Value iterators.
 *

</member>
<member name="M:Json.ValueIteratorBase.key" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="761">
Return either the index or the member name of the referenced value as a
Value.
</member>
<member name="M:Json.ValueIteratorBase.index" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="765">
Return the index of the referenced Value, or -1 if it is not an
arrayValue.
</member>
<member name="M:Json.ValueIteratorBase.name" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="769">
Return the member name of the referenced Value, or "" if it is not an
objectValue.
\note Avoid `c_str()` on result, as embedded zeroes are possible.
</member>
<member name="M:Json.ValueIteratorBase.memberName" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="774">
Return the member name of the referenced Value. "" if it is not an
objectValue.
\deprecated This cannot be used for UTF-8 strings, since there can be
embedded nulls.
</member>
<member name="M:Json.ValueIteratorBase.memberName(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst**)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="780">
Return the member name of the referenced Value, or NULL if it is not an
objectValue.
\note Better version than memberName(). Allows embedded nulls.
</member>
<member name="T:Json.ValueConstIterator" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="817">
\brief const iterator for object and array value.
 *

</member>
<member name="T:Json.ValueIterator" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\value.h" line="869">
\brief Iterator for object and array value.

</member>
<member name="T:Json.Reader" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="30">
\brief Unserialize a <a HREF="http://www.json.org">JSON</a> document into a
 * Value.
 *
 * \deprecated Use CharReader and CharReaderBuilder.

</member>
<member name="T:Json.Reader.StructuredError" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="41">
\brief An error tagged with where in the JSON text it was encountered.
   *
   * The offsets give the [start, limit) range of bytes within the text. Note
   * that this is bytes, not codepoints.

</member>
<member name="M:Json.Reader.#ctor" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="52">
\brief Constructs a Reader allowing all features for parsing.
    * \deprecated Use CharReader and CharReaderBuilder.

</member>
<member name="M:Json.Reader.#ctor(Json.Features!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="57">
\brief Constructs a Reader allowing the specified feature set for parsing.
    * \deprecated Use CharReader and CharReaderBuilder.

</member>
<member name="M:Json.Reader.parse(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="62">
\brief Read a Value from a <a HREF="http://www.json.org">JSON</a>
   * document.
   *
   * \param      document        UTF-8 encoded string containing the document
   *                             to read.
   * \param[out] root            Contains the root value of the document if it
   *                             was successfully parsed.
   * \param      collectComments \c true to collect comment and allow writing
   *                             them back during serialization, \c false to
   *                             discard comments.  This parameter is ignored
   *                             if Features::allowComments_ is \c false.
   * \return \c true if the document was successfully parsed, \c false if an
   * error occurred.

</member>
<member name="M:Json.Reader.parse(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,Json.Value*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="79">
\brief Read a Value from a <a HREF="http://www.json.org">JSON</a>
   * document.
   *
   * \param      beginDoc        Pointer on the beginning of the UTF-8 encoded
   *                             string of the document to read.
   * \param      endDoc          Pointer on the end of the UTF-8 encoded string
   *                             of the document to read.  Must be &gt;= beginDoc.
   * \param[out] root            Contains the root value of the document if it
   *                             was successfully parsed.
   * \param      collectComments \c true to collect comment and allow writing
   *                             them back during serialization, \c false to
   *                             discard comments.  This parameter is ignored
   *                             if Features::allowComments_ is \c false.
   * \return \c true if the document was successfully parsed, \c false if an
   * error occurred.

</member>
<!-- Discarding badly formed XML document comment for member 'M:Json.Reader.parse(std.basic_istream<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}>*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean)'. -->
<member name="M:Json.Reader.getFormatedErrorMessages" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="102">
\brief Returns a user friendly string that list errors in the parsed
   * document.
   *
   * \return Formatted error message with the list of errors with their
   * location in the parsed document. An empty string is returned if no error
   * occurred during parsing.
   * \deprecated Use getFormattedErrorMessages() instead (typo fix).

</member>
<member name="M:Json.Reader.getFormattedErrorMessages" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="113">
\brief Returns a user friendly string that list errors in the parsed
   * document.
   *
   * \return Formatted error message with the list of errors with their
   * location in the parsed document. An empty string is returned if no error
   * occurred during parsing.

</member>
<member name="M:Json.Reader.getStructuredErrors" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="122">
\brief Returns a vector of structured errors encountered while parsing.
   *
   * \return A (possibly empty) vector of StructuredError objects. Currently
   * only one error can be returned, but the caller should tolerate multiple
   * errors.  This can occur if the parser recovers from a non-fatal parse
   * error and then encounters additional errors.

</member>
<member name="M:Json.Reader.pushError(Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="131">
\brief Add a semantic error message.
   *
   * \param value   JSON Value location associated with the error
   * \param message The error message.
   * \return \c true if the error was successfully added, \c false if the Value
   * offset exceeds the document size.

</member>
<member name="M:Json.Reader.pushError(Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="140">
\brief Add a semantic error message with extra context.
   *
   * \param value   JSON Value location associated with the error
   * \param message The error message.
   * \param extra   Additional JSON Value location to contextualize the error
   * \return \c true if the error was successfully added, \c false if either
   * Value offset exceeds the document size.

</member>
<member name="M:Json.Reader.good" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="150">
\brief Return whether there are any errors.
   *
   * \return \c true if there are no errors to report \c false if errors have
   * occurred.

</member>
<member name="T:Json.CharReader" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="242">
Interface for reading JSON from a char array.

</member>
<member name="M:Json.CharReader.parse(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,Json.Value*,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;*)" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="247">
\brief Read a Value from a <a HREF="http://www.json.org">JSON</a>
   * document. The document must be a UTF-8 encoded string containing the
   * document to read.
   *
   * \param      beginDoc Pointer on the beginning of the UTF-8 encoded string
   *                      of the document to read.
   * \param      endDoc   Pointer on the end of the UTF-8 encoded string of the
   *                      document to read. Must be &gt;= beginDoc.
   * \param[out] root     Contains the root value of the document if it was
   *                      successfully parsed.
   * \param[out] errs     Formatted error messages (if not NULL) a user
   *                      friendly string that lists errors in the parsed
   *                      document.
   * \return \c true if the document was successfully parsed, \c false if an
   * error occurred.

</member>
<member name="M:Json.CharReader.Factory.newCharReader" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="269">
\brief Allocate a CharReader via operator new().
     * \throw std::exception if something goes wrong (e.g. invalid settings)

</member>
<!-- Discarding badly formed XML document comment for member 'T:Json.CharReaderBuilder'. -->
<member name="F:Json.CharReaderBuilder.settings_" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="292">
Configuration of this builder.
   * These are case-sensitive.
   * Available settings (case-sensitive):
   * - `"collectComments": false or true`
   *   - true to collect comment and allow writing them back during
   *     serialization, false to discard comments.  This parameter is ignored
   *     if allowComments is false.
   * - `"allowComments": false or true`
   *   - true if comments are allowed.
   * - `"allowTrailingCommas": false or true`
   *   - true if trailing commas in objects and arrays are allowed.
   * - `"strictRoot": false or true`
   *   - true if root must be either an array or an object value
   * - `"allowDroppedNullPlaceholders": false or true`
   *   - true if dropped null placeholders are allowed. (See
   *     StreamWriterBuilder.)
   * - `"allowNumericKeys": false or true`
   *   - true if numeric object keys are allowed.
   * - `"allowSingleQuotes": false or true`
   *   - true if '' are allowed for strings (both keys and values)
   * - `"stackLimit": integer`
   *   - Exceeding stackLimit (recursive depth of `readValue()`) will cause an
   *     exception.
   *   - This is a security issue (seg-faults caused by deeply nested JSON), so
   *     the default is low.
   * - `"failIfExtra": false or true`
   *   - If true, `parse()` returns false when extra non-whitespace trails the
   *     JSON value in the input string.
   * - `"rejectDupKeys": false or true`
   *   - If true, `parse()` returns false when a key is duplicated within an
   *     object.
   * - `"allowSpecialFloats": false or true`
   *   - If true, special float values (NaNs and infinities) are allowed and
   *     their values are lossfree restorable.
   * - `"skipBom": false or true`
   *   - If true, if the input starts with the Unicode byte order mark (BOM),
   *     it is skipped.
   *
   * You can examine 'settings_` yourself to see the defaults. You can also
   * write and read them just like any JSON Value.
   * \sa setDefaults()

</member>
<member name="M:Json.CharReaderBuilder.validate(Json.Value*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="341">
\return true if 'settings' are legal and consistent;
   *   otherwise, indicate bad settings via 'invalid'.

</member>
<member name="M:Json.CharReaderBuilder.op_Subscript(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="346">
A simple way to update a specific setting.

</member>
<member name="M:Json.CharReaderBuilder.setDefaults(Json.Value*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="350">
Called by ctor, but you can use this to reset settings_.
   * \pre 'settings' != NULL (but Json::null is fine)
   * \remark Defaults:
   * \snippet src/lib_json/json_reader.cpp CharReaderBuilderDefaults

</member>
<member name="M:Json.CharReaderBuilder.strictMode(Json.Value*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="356">
Same as old Features::strictMode().
   * \pre 'settings' != NULL (but Json::null is fine)
   * \remark Defaults:
   * \snippet src/lib_json/json_reader.cpp CharReaderBuilderStrictMode

</member>
<member name="M:Json.parseFromStream(Json.CharReader.Factory!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value*,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\reader.h" line="364">
Consume entire stream and use its begin/end.
 * Someday we might have a real StreamReader, but for now this
 * is convenient.

</member>
<!-- Discarding badly formed XML document comment for member 'M:Json.op_RightShift(std.basic_istream<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}>*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<!-- Discarding badly formed XML document comment for member 'T:Json.StreamWriter'. -->
<member name="M:Json.StreamWriter.write(Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*)" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="47">
Write Value into document as configured in sub-class.
   *   Do not take ownership of sout, but maintain a reference during function.
   *   \pre sout != NULL
   *   \return zero on success (For now, we always return zero, so check the
   *   stream instead.) \throw std::exception possibly, depending on
   * configuration

</member>
<member name="T:Json.StreamWriter.Factory" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="56">
\brief A simple abstract factory.

</member>
<member name="M:Json.StreamWriter.Factory.newStreamWriter" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="61">
\brief Allocate a CharReader via operator new().
     * \throw std::exception if something goes wrong (e.g. invalid settings)

</member>
<member name="M:Json.writeString(Json.StreamWriter.Factory!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="68">
\brief Write into stringstream, then return string, for convenience.
 * A StreamWriter will be created from the factory, used, and then deleted.

</member>
<!-- Discarding badly formed XML document comment for member 'T:Json.StreamWriterBuilder'. -->
<!-- Discarding badly formed XML document comment for member 'F:Json.StreamWriterBuilder.settings_'. -->
<member name="M:Json.StreamWriterBuilder.newStreamWriter" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="126">
\throw std::exception if something goes wrong (e.g. invalid settings)

</member>
<member name="M:Json.StreamWriterBuilder.validate(Json.Value*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="131">
\return true if 'settings' are legal and consistent;
   *   otherwise, indicate bad settings via 'invalid'.

</member>
<member name="M:Json.StreamWriterBuilder.op_Subscript(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="135">
A simple way to update a specific setting.

</member>
<member name="M:Json.StreamWriterBuilder.setDefaults(Json.Value*)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="139">
Called by ctor, but you can use this to reset settings_.
   * \pre 'settings' != NULL (but Json::null is fine)
   * \remark Defaults:
   * \snippet src/lib_json/json_writer.cpp StreamWriterBuilderDefaults

</member>
<member name="T:Json.Writer" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="147">
\brief Abstract class for writers.
 * \deprecated Use StreamWriter. (And really, this is an implementation detail.)

</member>
<member name="T:Json.FastWriter" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="157">
\brief Outputs a Value in <a HREF="http://www.json.org">JSON</a> format
 *without formatting (not human friendly).
 *
 * The JSON document is written in a single line. It is not intended for 'human'
 *consumption,
 * but may be useful to support feature such as RPC where bandwidth is limited.
 * \sa Reader, Value
 * \deprecated Use StreamWriterBuilder.

</member>
<member name="M:Json.FastWriter.dropNullPlaceholders" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="178">
\brief Drop the "null" string from the writer's output for nullValues.
   * Strictly speaking, this is not valid JSON. But when the output is being
   * fed to a browser's JavaScript, it makes for smaller output and the
   * browser can handle the output just fine.

</member>
<!-- Discarding badly formed XML document comment for member 'T:Json.StyledWriter'. -->
<member name="M:Json.StyledWriter.write(Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="237">
\brief Serialize a Value in <a HREF="http://www.json.org">JSON</a> format.
   * \param root Value to serialize.
   * \return String containing the JSON document that represents the root value.

</member>
<!-- Discarding badly formed XML document comment for member 'T:Json.StyledStreamWriter'. -->
<member name="M:Json.StyledStreamWriter.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="302">
\param indentation Each level will be indented by this amount extra.

</member>
<member name="M:Json.StyledStreamWriter.write(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="309">
\brief Serialize a Value in <a HREF="http://www.json.org">JSON</a> format.
   * \param out Stream to write to. (Can be ostringstream, e.g.)
   * \param root Value to serialize.
   * \note There is no point in deriving from Writer, since write() should not
   * return a value.

</member>
<member name="M:Json.op_LeftShift(std.basic_ostream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\json\writer.h" line="357">
\brief Output using the StyledStreamWriter.
\see Json::operator&gt;&gt;()
</member>
<member name="T:glm.qualifier" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\detail\qualifier.hpp" line="7">
Qualify GLM types in term of alignment (packed, aligned) and precision in term of ULPs (lowp, mediump, highp)
</member>
<member name="D:glm.bvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool2.hpp" line="9">
@addtogroup core_vector
@{
2 components vector of boolean.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.highp_bvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool2_precision.hpp" line="9">
@addtogroup core_vector_precision
@{
2 components vector of high qualifier bool numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_bvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool2_precision.hpp" line="18">
2 components vector of medium qualifier bool numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_bvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool2_precision.hpp" line="24">
2 components vector of low qualifier bool numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float2.hpp" line="9">
@addtogroup core_vector
@{
2 components vector of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.highp_vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float2_precision.hpp" line="9">
@addtogroup core_vector_precision
@{
2 components vector of high single-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float2_precision.hpp" line="18">
2 components vector of medium single-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float2_precision.hpp" line="24">
2 components vector of low single-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double2.hpp" line="9">
@addtogroup core_vector
@{
2 components vector of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.highp_dvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double2_precision.hpp" line="9">
@addtogroup core_vector_precision
@{
2 components vector of high double-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double2_precision.hpp" line="18">
2 components vector of medium double-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_dvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double2_precision.hpp" line="24">
2 components vector of low double-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.ivec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int2.hpp" line="9">
@addtogroup core_vector
@{
2 components vector of signed integer numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.int8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\scalar_int_sized.hpp" line="54">
@addtogroup ext_scalar_int_sized
@{
8 bit signed integer type.
</member>
<member name="D:glm.int16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\scalar_int_sized.hpp" line="60">
16 bit signed integer type.
</member>
<member name="D:glm.int32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\scalar_int_sized.hpp" line="63">
32 bit signed integer type.
</member>
<member name="D:glm.int64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\scalar_int_sized.hpp" line="66">
64 bit signed integer type.
</member>
<member name="D:glm.i8vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int2_sized.hpp" line="25">
@addtogroup ext_vector_int2_sized
@{
8 bit signed integer vector of 2 components type.

@see ext_vector_int2_sized
</member>
<member name="D:glm.i16vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int2_sized.hpp" line="33">
16 bit signed integer vector of 2 components type.

@see ext_vector_int2_sized
</member>
<member name="D:glm.i32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int2_sized.hpp" line="38">
32 bit signed integer vector of 2 components type.

@see ext_vector_int2_sized
</member>
<member name="D:glm.i64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int2_sized.hpp" line="43">
64 bit signed integer vector of 2 components type.

@see ext_vector_int2_sized
</member>
<member name="D:glm.uvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint2.hpp" line="9">
@addtogroup core_vector
@{
2 components vector of unsigned integer numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.uint8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\scalar_uint_sized.hpp" line="54">
@addtogroup ext_scalar_uint_sized
@{
8 bit unsigned integer type.
</member>
<member name="D:glm.uint16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\scalar_uint_sized.hpp" line="60">
16 bit unsigned integer type.
</member>
<member name="D:glm.uint32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\scalar_uint_sized.hpp" line="63">
32 bit unsigned integer type.
</member>
<member name="D:glm.uint64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\scalar_uint_sized.hpp" line="66">
64 bit unsigned integer type.
</member>
<member name="D:glm.u8vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint2_sized.hpp" line="25">
@addtogroup ext_vector_uint2_sized
@{
8 bit unsigned integer vector of 2 components type.

@see ext_vector_uint2_sized
</member>
<member name="D:glm.u16vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint2_sized.hpp" line="33">
16 bit unsigned integer vector of 2 components type.

@see ext_vector_uint2_sized
</member>
<member name="D:glm.u32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint2_sized.hpp" line="38">
32 bit unsigned integer vector of 2 components type.

@see ext_vector_uint2_sized
</member>
<member name="D:glm.u64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint2_sized.hpp" line="43">
64 bit unsigned integer vector of 2 components type.

@see ext_vector_uint2_sized
</member>
<member name="D:glm.bvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool3.hpp" line="9">
@addtogroup core_vector
@{
3 components vector of boolean.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.highp_bvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool3_precision.hpp" line="9">
@addtogroup core_vector_precision
@{
3 components vector of high qualifier bool numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_bvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool3_precision.hpp" line="18">
3 components vector of medium qualifier bool numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_bvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool3_precision.hpp" line="24">
3 components vector of low qualifier bool numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float3.hpp" line="9">
@addtogroup core_vector
@{
3 components vector of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.highp_vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float3_precision.hpp" line="9">
@addtogroup core_vector_precision
@{
3 components vector of high single-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float3_precision.hpp" line="18">
3 components vector of medium single-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float3_precision.hpp" line="24">
3 components vector of low single-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double3.hpp" line="9">
@addtogroup core_vector
@{
3 components vector of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.highp_dvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double3_precision.hpp" line="9">
@addtogroup core_vector_precision
@{
3 components vector of high double-qualifier floating-point numbers.
There is no guarantee on the actual qualifier.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double3_precision.hpp" line="19">
3 components vector of medium double-qualifier floating-point numbers.
There is no guarantee on the actual qualifier.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_dvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double3_precision.hpp" line="26">
3 components vector of low double-qualifier floating-point numbers.
There is no guarantee on the actual qualifier.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.ivec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int3.hpp" line="9">
@addtogroup core_vector
@{
3 components vector of signed integer numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.i8vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int3_sized.hpp" line="25">
@addtogroup ext_vector_int3_sized
@{
8 bit signed integer vector of 3 components type.

@see ext_vector_int3_sized
</member>
<member name="D:glm.i16vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int3_sized.hpp" line="33">
16 bit signed integer vector of 3 components type.

@see ext_vector_int3_sized
</member>
<member name="D:glm.i32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int3_sized.hpp" line="38">
32 bit signed integer vector of 3 components type.

@see ext_vector_int3_sized
</member>
<member name="D:glm.i64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int3_sized.hpp" line="43">
64 bit signed integer vector of 3 components type.

@see ext_vector_int3_sized
</member>
<member name="D:glm.uvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint3.hpp" line="9">
@addtogroup core_vector
@{
3 components vector of unsigned integer numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.u8vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint3_sized.hpp" line="25">
@addtogroup ext_vector_uint3_sized
@{
8 bit unsigned integer vector of 3 components type.

@see ext_vector_uint3_sized
</member>
<member name="D:glm.u16vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint3_sized.hpp" line="33">
16 bit unsigned integer vector of 3 components type.

@see ext_vector_uint3_sized
</member>
<member name="D:glm.u32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint3_sized.hpp" line="38">
32 bit unsigned integer vector of 3 components type.

@see ext_vector_uint3_sized
</member>
<member name="D:glm.u64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint3_sized.hpp" line="43">
64 bit unsigned integer vector of 3 components type.

@see ext_vector_uint3_sized
</member>
<member name="D:glm.bvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool4.hpp" line="9">
@addtogroup core_vector
@{
4 components vector of boolean.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.highp_bvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool4_precision.hpp" line="9">
@addtogroup core_vector_precision
@{
4 components vector of high qualifier bool numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_bvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool4_precision.hpp" line="18">
4 components vector of medium qualifier bool numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_bvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool4_precision.hpp" line="24">
4 components vector of low qualifier bool numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float4.hpp" line="9">
@addtogroup core_vector
@{
4 components vector of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.highp_vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float4_precision.hpp" line="9">
@addtogroup core_vector_precision
@{
4 components vector of high single-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float4_precision.hpp" line="18">
4 components vector of medium single-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float4_precision.hpp" line="24">
4 components vector of low single-qualifier floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double4.hpp" line="9">
@addtogroup core_vector
@{
4 components vector of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.highp_dvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double4_precision.hpp" line="10">
@addtogroup core_vector_precision
@{
4 components vector of high double-qualifier floating-point numbers.
There is no guarantee on the actual qualifier.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double4_precision.hpp" line="20">
4 components vector of medium double-qualifier floating-point numbers.
There is no guarantee on the actual qualifier.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_dvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double4_precision.hpp" line="27">
4 components vector of low double-qualifier floating-point numbers.
There is no guarantee on the actual qualifier.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.ivec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int4.hpp" line="9">
@addtogroup core_vector
@{
4 components vector of signed integer numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.i8vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int4_sized.hpp" line="25">
@addtogroup ext_vector_int4_sized
@{
8 bit signed integer vector of 4 components type.

@see ext_vector_int4_sized
</member>
<member name="D:glm.i16vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int4_sized.hpp" line="33">
16 bit signed integer vector of 4 components type.

@see ext_vector_int4_sized
</member>
<member name="D:glm.i32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int4_sized.hpp" line="38">
32 bit signed integer vector of 4 components type.

@see ext_vector_int4_sized
</member>
<member name="D:glm.i64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int4_sized.hpp" line="43">
64 bit signed integer vector of 4 components type.

@see ext_vector_int4_sized
</member>
<member name="D:glm.uvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint4.hpp" line="9">
@addtogroup core_vector
@{
4 components vector of unsigned integer numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.5 Vectors</a>
</member>
<member name="D:glm.u8vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint4_sized.hpp" line="25">
@addtogroup ext_vector_uint4_sized
@{
8 bit unsigned integer vector of 4 components type.

@see ext_vector_uint4_sized
</member>
<member name="D:glm.u16vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint4_sized.hpp" line="33">
16 bit unsigned integer vector of 4 components type.

@see ext_vector_uint4_sized
</member>
<member name="D:glm.u32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint4_sized.hpp" line="38">
32 bit unsigned integer vector of 4 components type.

@see ext_vector_uint4_sized
</member>
<member name="D:glm.u64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint4_sized.hpp" line="43">
64 bit unsigned integer vector of 4 components type.

@see ext_vector_uint4_sized
</member>
<member name="D:glm.dmat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x3.hpp" line="9">
@addtogroup core_matrix
@{
2 columns of 3 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_dmat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x3_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
2 columns of 3 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x3_precision.hpp" line="18">
2 columns of 3 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x3_precision.hpp" line="24">
2 columns of 3 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x3.hpp" line="9">
@addtogroup core_matrix
@{
2 columns of 3 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x3_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
2 columns of 3 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x3_precision.hpp" line="18">
2 columns of 3 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x3_precision.hpp" line="24">
2 columns of 3 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dmat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x4.hpp" line="9">
@addtogroup core_matrix
@{
2 columns of 4 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_dmat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x4_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
2 columns of 4 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x4_precision.hpp" line="18">
2 columns of 4 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x4_precision.hpp" line="24">
2 columns of 4 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x4.hpp" line="9">
@addtogroup core_matrix
@{
2 columns of 4 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x4_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
2 columns of 4 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x4_precision.hpp" line="18">
2 columns of 4 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x4_precision.hpp" line="24">
2 columns of 4 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dmat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x2.hpp" line="9">
@addtogroup core_matrix
@{
3 columns of 2 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_dmat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x2_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
3 columns of 2 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x2_precision.hpp" line="18">
3 columns of 2 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x2_precision.hpp" line="24">
3 columns of 2 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x2.hpp" line="9">
@addtogroup core
@{
3 columns of 2 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x2_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
3 columns of 2 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x2_precision.hpp" line="18">
3 columns of 2 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x2_precision.hpp" line="24">
3 columns of 2 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dmat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x3.hpp" line="9">
@addtogroup core_matrix
@{
3 columns of 3 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.dmat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x3.hpp" line="17">
3 columns of 3 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_dmat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x3_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
3 columns of 3 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x3_precision.hpp" line="18">
3 columns of 3 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x3_precision.hpp" line="24">
3 columns of 3 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_dmat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x3_precision.hpp" line="30">
3 columns of 3 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x3_precision.hpp" line="36">
3 columns of 3 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x3_precision.hpp" line="42">
3 columns of 3 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x3.hpp" line="9">
@addtogroup core_matrix
@{
3 columns of 3 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x3.hpp" line="17">
3 columns of 3 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x3_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
3 columns of 3 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x3_precision.hpp" line="18">
3 columns of 3 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x3_precision.hpp" line="24">
3 columns of 3 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x3_precision.hpp" line="30">
3 columns of 3 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x3_precision.hpp" line="36">
3 columns of 3 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x3_precision.hpp" line="42">
3 columns of 3 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dmat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x4.hpp" line="9">
@addtogroup core_matrix
@{
3 columns of 4 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_dmat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x4_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
3 columns of 4 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x4_precision.hpp" line="18">
3 columns of 4 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double3x4_precision.hpp" line="24">
3 columns of 4 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x4.hpp" line="9">
@addtogroup core_matrix
@{
3 columns of 4 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x4_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
3 columns of 4 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x4_precision.hpp" line="18">
3 columns of 4 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float3x4_precision.hpp" line="24">
3 columns of 4 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dmat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x2.hpp" line="9">
@addtogroup core_matrix
@{
4 columns of 2 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_dmat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x2_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
4 columns of 2 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x2_precision.hpp" line="18">
4 columns of 2 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x2_precision.hpp" line="24">
4 columns of 2 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x2.hpp" line="9">
@addtogroup core_matrix
@{
4 columns of 2 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x2_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
4 columns of 2 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x2_precision.hpp" line="18">
4 columns of 2 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x2_precision.hpp" line="24">
4 columns of 2 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dmat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x3.hpp" line="9">
@addtogroup core_matrix
@{
4 columns of 3 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_dmat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x3_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
4 columns of 3 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x3_precision.hpp" line="18">
4 columns of 3 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x3_precision.hpp" line="24">
4 columns of 3 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x3.hpp" line="9">
@addtogroup core_matrix
@{
4 columns of 3 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x3_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
4 columns of 3 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x3_precision.hpp" line="18">
4 columns of 3 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x3_precision.hpp" line="24">
4 columns of 3 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.dmat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x4.hpp" line="9">
@addtogroup core_matrix
@{
4 columns of 4 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.dmat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x4.hpp" line="17">
4 columns of 4 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_dmat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x4_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
4 columns of 4 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x4_precision.hpp" line="18">
4 columns of 4 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x4_precision.hpp" line="24">
4 columns of 4 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_dmat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x4_precision.hpp" line="30">
4 columns of 4 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x4_precision.hpp" line="36">
4 columns of 4 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double4x4_precision.hpp" line="42">
4 columns of 4 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x4.hpp" line="9">
@ingroup core_matrix
@{
4 columns of 4 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x4.hpp" line="17">
4 columns of 4 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x4_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
4 columns of 4 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x4_precision.hpp" line="18">
4 columns of 4 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x4_precision.hpp" line="24">
4 columns of 4 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x4_precision.hpp" line="30">
4 columns of 4 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x4_precision.hpp" line="36">
4 columns of 4 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float4x4_precision.hpp" line="42">
4 columns of 4 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="M:glm.floatBitsToInt(System.Single!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\common.hpp" line="401">
Returns a signed integer value representing
the encoding of a floating-point value. The floating-point
value's bit-level representation is preserved.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/floatBitsToInt.xml">GLSL floatBitsToInt man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.3 Common Functions</a>
</member>
<member name="M:glm.floatBitsToUint(System.Single!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\common.hpp" line="421">
Returns a unsigned integer value representing
the encoding of a floating-point value. The floatingpoint
value's bit-level representation is preserved.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/floatBitsToUint.xml">GLSL floatBitsToUint man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.3 Common Functions</a>
</member>
<member name="M:glm.intBitsToFloat(System.Int32!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\common.hpp" line="441">
Returns a floating-point value corresponding to a signed
integer encoding of a floating-point value.
If an inf or NaN is passed in, it will not signal, and the
resulting floating point value is unspecified. Otherwise,
the bit-level representation is preserved.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/intBitsToFloat.xml">GLSL intBitsToFloat man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.3 Common Functions</a>
</member>
<member name="M:glm.uintBitsToFloat(System.UInt32!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\common.hpp" line="465">
Returns a floating-point value corresponding to a
unsigned integer encoding of a floating-point value.
If an inf or NaN is passed in, it will not signal, and the
resulting floating point value is unspecified. Otherwise,
the bit-level representation is preserved.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/uintBitsToFloat.xml">GLSL uintBitsToFloat man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.3 Common Functions</a>
</member>
<member name="D:glm.dmat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x2.hpp" line="9">
@addtogroup core_matrix
@{
2 columns of 2 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.dmat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x2.hpp" line="17">
2 columns of 2 components matrix of double-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_dmat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x2_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
2 columns of 2 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x2_precision.hpp" line="18">
2 columns of 2 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x2_precision.hpp" line="24">
2 columns of 2 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_dmat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x2_precision.hpp" line="30">
2 columns of 2 components matrix of double-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_dmat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x2_precision.hpp" line="36">
2 columns of 2 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_dmat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_double2x2_precision.hpp" line="42">
2 columns of 2 components matrix of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x2.hpp" line="9">
@addtogroup core_matrix
@{
2 columns of 2 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x2.hpp" line="17">
2 columns of 2 components matrix of single-precision floating-point numbers.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
</member>
<member name="D:glm.lowp_mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x2_precision.hpp" line="9">
@addtogroup core_matrix_precision
@{
2 columns of 2 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x2_precision.hpp" line="18">
2 columns of 2 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x2_precision.hpp" line="24">
2 columns of 2 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.lowp_mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x2_precision.hpp" line="30">
2 columns of 2 components matrix of single-precision floating-point numbers using low precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.mediump_mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x2_precision.hpp" line="36">
2 columns of 2 components matrix of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="D:glm.highp_mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\matrix_float2x2_precision.hpp" line="42">
2 columns of 2 components matrix of single-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.1.6 Matrices</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 4.7.2 Precision Qualifier</a>
</member>
<member name="M:glm.packUnorm2x16(glm.vec&lt;0x2,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="24">
@addtogroup core_func_packing
@{
First, converts each component of the normalized floating-point value v into 8- or 16-bit integer values.
Then, the results are packed into the returned 32-bit unsigned integer.

The conversion for component c of v to fixed point is done as follows:
packUnorm2x16: round(clamp(c, 0, +1) * 65535.0)

The first component of the vector will be written to the least significant bits of the output;
the last component will be written to the most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/packUnorm2x16.xml">GLSL packUnorm2x16 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.packSnorm2x16(glm.vec&lt;0x2,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="40">
First, converts each component of the normalized floating-point value v into 8- or 16-bit integer values.
Then, the results are packed into the returned 32-bit unsigned integer.

The conversion for component c of v to fixed point is done as follows:
packSnorm2x16: round(clamp(v, -1, +1) * 32767.0)

The first component of the vector will be written to the least significant bits of the output;
the last component will be written to the most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/packSnorm2x16.xml">GLSL packSnorm2x16 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.packUnorm4x8(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="53">
First, converts each component of the normalized floating-point value v into 8- or 16-bit integer values.
Then, the results are packed into the returned 32-bit unsigned integer.

The conversion for component c of v to fixed point is done as follows:
packUnorm4x8:	round(clamp(c, 0, +1) * 255.0)

The first component of the vector will be written to the least significant bits of the output;
the last component will be written to the most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/packUnorm4x8.xml">GLSL packUnorm4x8 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.packSnorm4x8(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="66">
First, converts each component of the normalized floating-point value v into 8- or 16-bit integer values.
Then, the results are packed into the returned 32-bit unsigned integer.

The conversion for component c of v to fixed point is done as follows:
packSnorm4x8:	round(clamp(c, -1, +1) * 127.0)

The first component of the vector will be written to the least significant bits of the output;
the last component will be written to the most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/packSnorm4x8.xml">GLSL packSnorm4x8 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.unpackUnorm2x16(System.UInt32)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="79">
First, unpacks a single 32-bit unsigned integer p into a pair of 16-bit unsigned integers, four 8-bit unsigned integers, or four 8-bit signed integers.
Then, each component is converted to a normalized floating-point value to generate the returned two- or four-component vector.

The conversion for unpacked fixed-point value f to floating point is done as follows:
unpackUnorm2x16: f / 65535.0

The first component of the returned vector will be extracted from the least significant bits of the input;
the last component will be extracted from the most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/unpackUnorm2x16.xml">GLSL unpackUnorm2x16 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.unpackSnorm2x16(System.UInt32)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="92">
First, unpacks a single 32-bit unsigned integer p into a pair of 16-bit unsigned integers, four 8-bit unsigned integers, or four 8-bit signed integers.
Then, each component is converted to a normalized floating-point value to generate the returned two- or four-component vector.

The conversion for unpacked fixed-point value f to floating point is done as follows:
unpackSnorm2x16: clamp(f / 32767.0, -1, +1)

The first component of the returned vector will be extracted from the least significant bits of the input;
the last component will be extracted from the most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/unpackSnorm2x16.xml">GLSL unpackSnorm2x16 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.unpackUnorm4x8(System.UInt32)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="105">
First, unpacks a single 32-bit unsigned integer p into a pair of 16-bit unsigned integers, four 8-bit unsigned integers, or four 8-bit signed integers.
Then, each component is converted to a normalized floating-point value to generate the returned two- or four-component vector.

The conversion for unpacked fixed-point value f to floating point is done as follows:
unpackUnorm4x8: f / 255.0

The first component of the returned vector will be extracted from the least significant bits of the input;
the last component will be extracted from the most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/unpackUnorm4x8.xml">GLSL unpackUnorm4x8 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.unpackSnorm4x8(System.UInt32)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="118">
First, unpacks a single 32-bit unsigned integer p into a pair of 16-bit unsigned integers, four 8-bit unsigned integers, or four 8-bit signed integers.
Then, each component is converted to a normalized floating-point value to generate the returned two- or four-component vector.

The conversion for unpacked fixed-point value f to floating point is done as follows:
unpackSnorm4x8: clamp(f / 127.0, -1, +1)

The first component of the returned vector will be extracted from the least significant bits of the input;
the last component will be extracted from the most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/unpackSnorm4x8.xml">GLSL unpackSnorm4x8 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.packDouble2x32(glm.vec&lt;0x2,System.UInt32,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="131">
Returns a double-qualifier value obtained by packing the components of v into a 64-bit value.
If an IEEE 754 Inf or NaN is created, it will not signal, and the resulting floating point value is unspecified.
Otherwise, the bit- level representation of v is preserved.
The first vector component specifies the 32 least significant bits;
the second component specifies the 32 most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/packDouble2x32.xml">GLSL packDouble2x32 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.unpackDouble2x32(System.Double)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="141">
Returns a two-component unsigned integer vector representation of v.
The bit-level representation of v is preserved.
The first component of the vector contains the 32 least significant bits of the double;
the second component consists the 32 most significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/unpackDouble2x32.xml">GLSL unpackDouble2x32 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.packHalf2x16(glm.vec&lt;0x2,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="150">
Returns an unsigned integer obtained by converting the components of a two-component floating-point vector
to the 16-bit floating-point representation found in the OpenGL Specification,
and then packing these two 16- bit integers into a 32-bit unsigned integer.
The first vector component specifies the 16 least-significant bits of the result;
the second component specifies the 16 most-significant bits.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/packHalf2x16.xml">GLSL packHalf2x16 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="M:glm.unpackHalf2x16(System.UInt32)" decl="true" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\packing.hpp" line="160">
Returns a two-component floating-point vector with components obtained by unpacking a 32-bit unsigned integer into a pair of 16-bit values,
interpreting those values as 16-bit floating-point numbers according to the OpenGL Specification,
and converting them to 32-bit floating-point values.
The first component of the vector is obtained from the 16 least-significant bits of v;
the second component is obtained from the 16 most-significant bits of v.

@see <a href="http://www.opengl.org/sdk/docs/manglsl/xhtml/unpackHalf2x16.xml">GLSL unpackHalf2x16 man page</a>
@see <a href="http://www.opengl.org/registry/doc/GLSLangSpec.4.20.8.pdf">GLSL 4.20.8 specification, section 8.4 Floating-Point Pack and Unpack Functions</a>
</member>
<member name="T:_SETJMP_FLOAT128" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\detail\func_integer.inl" line="1">
@ref core
</member>
<member name="D:glm.quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\quaternion_float.hpp" line="31">
@addtogroup ext_quaternion_float
@{
Quaternion of single-precision floating-point numbers.
</member>
<member name="D:glm.lowp_quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\quaternion_float_precision.hpp" line="22">
@addtogroup ext_quaternion_float_precision
@{
Quaternion of single-precision floating-point numbers using high precision arithmetic in term of ULPs.
</member>
<member name="D:glm.mediump_quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\quaternion_float_precision.hpp" line="28">
Quaternion of single-precision floating-point numbers using high precision arithmetic in term of ULPs.
</member>
<member name="D:glm.highp_quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\quaternion_float_precision.hpp" line="31">
Quaternion of single-precision floating-point numbers using high precision arithmetic in term of ULPs.
</member>
<member name="D:glm.dquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\quaternion_double.hpp" line="31">
@addtogroup ext_quaternion_double
@{
Quaternion of double-precision floating-point numbers.
</member>
<member name="D:glm.lowp_dquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\quaternion_double_precision.hpp" line="22">
@addtogroup ext_quaternion_double_precision
@{
Quaternion of double-precision floating-point numbers using high precision arithmetic in term of ULPs.

@see ext_quaternion_double_precision
</member>
<member name="D:glm.mediump_dquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\quaternion_double_precision.hpp" line="30">
Quaternion of medium double-qualifier floating-point numbers using high precision arithmetic in term of ULPs.

@see ext_quaternion_double_precision
</member>
<member name="D:glm.highp_dquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\quaternion_double_precision.hpp" line="35">
Quaternion of high double-qualifier floating-point numbers using high precision arithmetic in term of ULPs.

@see ext_quaternion_double_precision
</member>
<member name="D:glm.bvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool1.hpp" line="23">
@addtogroup ext_vector_bool1
@{
1 components vector of boolean.
</member>
<member name="D:glm.highp_bvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool1_precision.hpp" line="21">
@addtogroup ext_vector_bool1_precision
@{
1 component vector of bool values.
</member>
<member name="D:glm.mediump_bvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool1_precision.hpp" line="27">
1 component vector of bool values.
</member>
<member name="D:glm.lowp_bvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_bool1_precision.hpp" line="30">
1 component vector of bool values.
</member>
<member name="D:glm.vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float1.hpp" line="24">
@addtogroup ext_vector_float1
@{
1 components vector of single-precision floating-point numbers.
</member>
<member name="D:glm.highp_vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float1_precision.hpp" line="23">
@addtogroup ext_vector_float1_precision
@{
1 component vector of single-precision floating-point numbers using high precision arithmetic in term of ULPs.
</member>
<member name="D:glm.mediump_vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float1_precision.hpp" line="29">
1 component vector of single-precision floating-point numbers using medium precision arithmetic in term of ULPs.
</member>
<member name="D:glm.lowp_vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_float1_precision.hpp" line="32">
1 component vector of single-precision floating-point numbers using low precision arithmetic in term of ULPs.
</member>
<member name="D:glm.dvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double1.hpp" line="24">
@addtogroup ext_vector_double1
@{
1 components vector of double-precision floating-point numbers.
</member>
<member name="D:glm.highp_dvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double1_precision.hpp" line="23">
@addtogroup ext_vector_double1_precision
@{
1 component vector of double-precision floating-point numbers using high precision arithmetic in term of ULPs.
</member>
<member name="D:glm.mediump_dvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double1_precision.hpp" line="29">
1 component vector of double-precision floating-point numbers using medium precision arithmetic in term of ULPs.
</member>
<member name="D:glm.lowp_dvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_double1_precision.hpp" line="32">
1 component vector of double-precision floating-point numbers using low precision arithmetic in term of ULPs.
</member>
<member name="D:glm.ivec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int1.hpp" line="24">
@addtogroup ext_vector_int1
@{
1 component vector of signed integer numbers.
</member>
<member name="D:glm.i8vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int1_sized.hpp" line="25">
@addtogroup ext_vector_int1_sized
@{
8 bit signed integer vector of 1 component type.

@see ext_vector_int1_sized
</member>
<member name="D:glm.i16vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int1_sized.hpp" line="33">
16 bit signed integer vector of 1 component type.

@see ext_vector_int1_sized
</member>
<member name="D:glm.i32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int1_sized.hpp" line="38">
32 bit signed integer vector of 1 component type.

@see ext_vector_int1_sized
</member>
<member name="D:glm.i64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_int1_sized.hpp" line="43">
64 bit signed integer vector of 1 component type.

@see ext_vector_int1_sized
</member>
<member name="D:glm.uvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint1.hpp" line="24">
@addtogroup ext_vector_uint1
@{
1 component vector of unsigned integer numbers.
</member>
<member name="D:glm.u8vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint1_sized.hpp" line="25">
@addtogroup ext_vector_uint1_sized
@{
8 bit unsigned integer vector of 1 component type.

@see ext_vector_uint1_sized
</member>
<member name="D:glm.u16vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint1_sized.hpp" line="33">
16 bit unsigned integer vector of 1 component type.

@see ext_vector_uint1_sized
</member>
<member name="D:glm.u32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint1_sized.hpp" line="38">
32 bit unsigned integer vector of 1 component type.

@see ext_vector_uint1_sized
</member>
<member name="D:glm.u64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\ext\vector_uint1_sized.hpp" line="43">
64 bit unsigned integer vector of 1 component type.

@see ext_vector_uint1_sized
</member>
<member name="D:glm.lowp_int8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="51">
@addtogroup gtc_type_precision
@{
Low qualifier 8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_int16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="58">
Low qualifier 16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_int32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="62">
Low qualifier 32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_int64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="66">
Low qualifier 64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_int8_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="70">
Low qualifier 8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_int16_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="74">
Low qualifier 16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_int32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="78">
Low qualifier 32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_int64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="82">
Low qualifier 64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="86">
Low qualifier 8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="90">
Low qualifier 16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="94">
Low qualifier 32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="98">
Low qualifier 64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_int8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="102">
Medium qualifier 8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_int16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="106">
Medium qualifier 16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_int32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="110">
Medium qualifier 32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_int64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="114">
Medium qualifier 64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_int8_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="118">
Medium qualifier 8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_int16_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="122">
Medium qualifier 16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_int32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="126">
Medium qualifier 32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_int64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="130">
Medium qualifier 64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="134">
Medium qualifier 8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="138">
Medium qualifier 16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="142">
Medium qualifier 32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="146">
Medium qualifier 64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_int8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="150">
High qualifier 8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_int16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="154">
High qualifier 16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_int32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="158">
High qualifier 32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_int64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="162">
High qualifier 64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_int8_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="166">
High qualifier 8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_int16_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="170">
High qualifier 16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_int32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="174">
32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_int64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="178">
High qualifier 64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="182">
High qualifier 8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="186">
High qualifier 16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="190">
High qualifier 32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="194">
High qualifier 64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.i8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="222">
8 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.i16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="226">
16 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.i32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="230">
32 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.i64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="234">
64 bit signed integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uint8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="241">
Low qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uint16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="245">
Low qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uint32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="249">
Low qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uint64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="253">
Low qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uint8_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="257">
Low qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uint16_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="261">
Low qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uint32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="265">
Low qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uint64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="269">
Low qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="273">
Low qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="277">
Low qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="281">
Low qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="285">
Low qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uint8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="289">
Medium qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uint16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="293">
Medium qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uint32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="297">
Medium qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uint64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="301">
Medium qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uint8_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="305">
Medium qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uint16_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="309">
Medium qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uint32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="313">
Medium qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uint64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="317">
Medium qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="321">
Medium qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="325">
Medium qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="329">
Medium qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="333">
Medium qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uint8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="337">
High qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uint16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="341">
High qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uint32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="345">
High qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uint64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="349">
High qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uint8_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="353">
High qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uint16_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="357">
High qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uint32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="361">
High qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uint64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="365">
High qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="369">
High qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="373">
High qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="377">
High qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="381">
High qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.u8" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="408">
Default qualifier 8 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.u16" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="412">
Default qualifier 16 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.u32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="416">
Default qualifier 32 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.u64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="420">
Default qualifier 64 bit unsigned integer type.
@see gtc_type_precision
</member>
<member name="D:glm.float32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="431">
Single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.float64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="435">
Double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="439">
Low 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="443">
Low 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="447">
Low 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="451">
Low 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="455">
Low 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="459">
Low 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="463">
Low 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="467">
Low 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="471">
Low 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="475">
Low 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="479">
Low 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="483">
Low 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="488">
Low 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="492">
Low 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="496">
Low 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_float64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="500">
Low 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="504">
Low 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="508">
Low 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_float32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="513">
Medium 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_float64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="517">
Medium 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_float32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="521">
Medium 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_float64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="525">
Medium 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="529">
Medium 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="533">
Medium 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.highp_float32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="538">
High 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.highp_float64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="542">
High 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.highp_float32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="546">
High 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.highp_float64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="550">
High 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="554">
High 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="558">
High 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.float32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="599">
Default 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.float64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="603">
Default 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.f32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="607">
Default 32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.f64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="611">
Default 64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="617">
Low single-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="621">
Low single-qualifier floating-point vector of 2 components.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="625">
Low single-qualifier floating-point vector of 3 components.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="629">
Low single-qualifier floating-point vector of 4 components.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="634">
Medium single-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="638">
Medium Single-qualifier floating-point vector of 2 components.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="642">
Medium Single-qualifier floating-point vector of 3 components.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="646">
Medium Single-qualifier floating-point vector of 4 components.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="651">
High single-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="655">
High Single-qualifier floating-point vector of 2 components.
@see core_precision
</member>
<member name="D:glm.highp_fvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="659">
High Single-qualifier floating-point vector of 3 components.
@see core_precision
</member>
<member name="D:glm.highp_fvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="663">
High Single-qualifier floating-point vector of 4 components.
@see core_precision
</member>
<member name="D:glm.lowp_f32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="668">
Low single-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="672">
Low single-qualifier floating-point vector of 2 components.
@see core_precision
</member>
<member name="D:glm.lowp_f32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="676">
Low single-qualifier floating-point vector of 3 components.
@see core_precision
</member>
<member name="D:glm.lowp_f32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="680">
Low single-qualifier floating-point vector of 4 components.
@see core_precision
</member>
<member name="D:glm.mediump_f32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="684">
Medium single-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="688">
Medium single-qualifier floating-point vector of 2 components.
@see core_precision
</member>
<member name="D:glm.mediump_f32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="692">
Medium single-qualifier floating-point vector of 3 components.
@see core_precision
</member>
<member name="D:glm.mediump_f32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="696">
Medium single-qualifier floating-point vector of 4 components.
@see core_precision
</member>
<member name="D:glm.highp_f32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="700">
High single-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="704">
High single-qualifier floating-point vector of 2 components.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="708">
High single-qualifier floating-point vector of 3 components.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="712">
High single-qualifier floating-point vector of 4 components.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="717">
Low double-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="721">
Low double-qualifier floating-point vector of 2 components.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="725">
Low double-qualifier floating-point vector of 3 components.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="729">
Low double-qualifier floating-point vector of 4 components.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="733">
Medium double-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="737">
Medium double-qualifier floating-point vector of 2 components.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="741">
Medium double-qualifier floating-point vector of 3 components.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="745">
Medium double-qualifier floating-point vector of 4 components.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="749">
High double-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="753">
High double-qualifier floating-point vector of 2 components.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="757">
High double-qualifier floating-point vector of 3 components.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="761">
High double-qualifier floating-point vector of 4 components.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="770">
Low single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Low single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="778">
Low single-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="782">
Low single-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="786">
Low single-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="790">
Low single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="794">
Low single-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="798">
Low single-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="802">
Low single-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="806">
Low single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="810">
Low single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Low single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="818">
Low single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_fmat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="822">
Low single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="827">
Medium single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Medium single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="835">
Medium single-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="839">
Medium single-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="843">
Medium single-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="847">
Medium single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="851">
Medium single-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="855">
Medium single-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="859">
Medium single-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="863">
Medium single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="867">
Medium single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Medium single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="875">
Medium single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_fmat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="879">
Medium single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="884">
High single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
High single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="892">
High single-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="896">
High single-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="900">
High single-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="904">
High single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="908">
High single-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="912">
High single-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="916">
High single-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="920">
High single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="924">
High single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
High single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="932">
High single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_fmat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="936">
High single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="941">
Low single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Low single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="949">
Low single-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="953">
Low single-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="957">
Low single-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="961">
Low single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="965">
Low single-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="969">
Low single-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="973">
Low single-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="977">
Low single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="981">
Low single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Low single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="989">
Low single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="993">
Low single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="998">
High single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Low single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1006">
Medium single-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1010">
Medium single-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1014">
Medium single-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1018">
Medium single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1022">
Medium single-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1026">
Medium single-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1030">
Medium single-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1034">
Medium single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1038">
Medium single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Medium single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1046">
Medium single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1050">
Medium single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1055">
High single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
High single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1063">
High single-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1067">
High single-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1071">
High single-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1075">
High single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1079">
High single-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1083">
High single-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1087">
High single-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1091">
High single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1095">
High single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
High single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1103">
High single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1107">
High single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1112">
Low double-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Low double-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1120">
Low double-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1124">
Low double-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1128">
Low double-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1132">
Low double-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1136">
Low double-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1140">
Low double-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1144">
Low double-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1148">
Low double-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1152">
Low double-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Low double-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1160">
Low double-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1164">
Low double-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1169">
Medium double-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Medium double-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1177">
Medium double-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1181">
Medium double-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1185">
Medium double-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1189">
Medium double-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1193">
Medium double-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1197">
Medium double-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1201">
Medium double-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1205">
Medium double-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1209">
Medium double-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Medium double-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1217">
Medium double-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1221">
Medium double-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1225">
High double-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
High double-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1233">
High double-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1237">
High double-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1241">
High double-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1245">
High double-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1249">
High double-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1253">
High double-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1257">
High double-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1261">
High double-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1265">
High double-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
High double-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1273">
High double-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1277">
High double-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_ivec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1285">
Low qualifier signed integer vector of 1 component type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_ivec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1289">
Low qualifier signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_ivec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1293">
Low qualifier signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_ivec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1297">
Low qualifier signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_ivec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1302">
Medium qualifier signed integer vector of 1 component type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_ivec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1306">
Medium qualifier signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_ivec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1310">
Medium qualifier signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_ivec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1314">
Medium qualifier signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_ivec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1319">
High qualifier signed integer vector of 1 component type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_ivec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1323">
High qualifier signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_ivec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1327">
High qualifier signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_ivec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1331">
High qualifier signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i8vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1336">
Low qualifier 8 bit signed integer vector of 1 component type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i8vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1340">
Low qualifier 8 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i8vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1344">
Low qualifier 8 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i8vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1348">
Low qualifier 8 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i8vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1353">
Medium qualifier 8 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i8vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1357">
Medium qualifier 8 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i8vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1361">
Medium qualifier 8 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i8vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1365">
Medium qualifier 8 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i8vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1370">
High qualifier 8 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i8vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1374">
High qualifier 8 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i8vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1378">
High qualifier 8 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i8vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1382">
High qualifier 8 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i16vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1387">
Low qualifier 16 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i16vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1391">
Low qualifier 16 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i16vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1395">
Low qualifier 16 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i16vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1399">
Low qualifier 16 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i16vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1404">
Medium qualifier 16 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i16vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1408">
Medium qualifier 16 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i16vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1412">
Medium qualifier 16 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i16vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1416">
Medium qualifier 16 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i16vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1421">
High qualifier 16 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i16vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1425">
High qualifier 16 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i16vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1429">
High qualifier 16 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i16vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1433">
High qualifier 16 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1438">
Low qualifier 32 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1442">
Low qualifier 32 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1446">
Low qualifier 32 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1450">
Low qualifier 32 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1455">
Medium qualifier 32 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1459">
Medium qualifier 32 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1463">
Medium qualifier 32 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1467">
Medium qualifier 32 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1472">
High qualifier 32 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1476">
High qualifier 32 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1480">
High qualifier 32 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1484">
High qualifier 32 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1489">
Low qualifier 64 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1493">
Low qualifier 64 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1497">
Low qualifier 64 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_i64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1501">
Low qualifier 64 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1506">
Medium qualifier 64 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1510">
Medium qualifier 64 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1514">
Medium qualifier 64 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_i64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1518">
Medium qualifier 64 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1523">
High qualifier 64 bit signed integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1527">
High qualifier 64 bit signed integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1531">
High qualifier 64 bit signed integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_i64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1535">
High qualifier 64 bit signed integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1543">
Low qualifier unsigned integer vector of 1 component type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1547">
Low qualifier unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1551">
Low qualifier unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_uvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1555">
Low qualifier unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1560">
Medium qualifier unsigned integer vector of 1 component type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1564">
Medium qualifier unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1568">
Medium qualifier unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_uvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1572">
Medium qualifier unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1577">
High qualifier unsigned integer vector of 1 component type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1581">
High qualifier unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1585">
High qualifier unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_uvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1589">
High qualifier unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u8vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1594">
Low qualifier 8 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u8vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1598">
Low qualifier 8 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u8vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1602">
Low qualifier 8 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u8vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1606">
Low qualifier 8 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u8vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1611">
Medium qualifier 8 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u8vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1615">
Medium qualifier 8 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u8vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1619">
Medium qualifier 8 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u8vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1623">
Medium qualifier 8 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u8vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1628">
High qualifier 8 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u8vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1632">
High qualifier 8 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u8vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1636">
High qualifier 8 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u8vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1640">
High qualifier 8 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u16vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1645">
Low qualifier 16 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u16vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1649">
Low qualifier 16 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u16vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1653">
Low qualifier 16 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u16vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1657">
Low qualifier 16 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u16vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1662">
Medium qualifier 16 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u16vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1666">
Medium qualifier 16 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u16vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1670">
Medium qualifier 16 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u16vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1674">
Medium qualifier 16 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u16vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1679">
High qualifier 16 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u16vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1683">
High qualifier 16 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u16vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1687">
High qualifier 16 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u16vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1691">
High qualifier 16 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1696">
Low qualifier 32 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1700">
Low qualifier 32 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1704">
Low qualifier 32 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1708">
Low qualifier 32 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1713">
Medium qualifier 32 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1717">
Medium qualifier 32 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1721">
Medium qualifier 32 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1725">
Medium qualifier 32 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1730">
High qualifier 32 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1734">
High qualifier 32 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1738">
High qualifier 32 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1742">
High qualifier 32 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1747">
Low qualifier 64 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1751">
Low qualifier 64 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1755">
Low qualifier 64 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_u64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1759">
Low qualifier 64 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1764">
Medium qualifier 64 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1768">
Medium qualifier 64 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1772">
Medium qualifier 64 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_u64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1776">
Medium qualifier 64 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1781">
High qualifier 64 bit unsigned integer scalar type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1785">
High qualifier 64 bit unsigned integer vector of 2 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1789">
High qualifier 64 bit unsigned integer vector of 3 components type.
@see gtc_type_precision
</member>
<member name="D:glm.highp_u64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1793">
High qualifier 64 bit unsigned integer vector of 4 components type.
@see gtc_type_precision
</member>
<member name="D:glm.float32_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1801">
32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.f32" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1805">
32 bit single-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.float64_t" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1811">
64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.f64" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1815">
64 bit double-qualifier floating-point scalar.
@see gtc_type_precision
</member>
<member name="D:glm.fvec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1820">
Single-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.fvec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1824">
Single-qualifier floating-point vector of 2 components.
@see gtc_type_precision
</member>
<member name="D:glm.fvec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1828">
Single-qualifier floating-point vector of 3 components.
@see gtc_type_precision
</member>
<member name="D:glm.fvec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1832">
Single-qualifier floating-point vector of 4 components.
@see gtc_type_precision
</member>
<member name="D:glm.f32vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1837">
Single-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.f32vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1841">
Single-qualifier floating-point vector of 2 components.
@see gtc_type_precision
</member>
<member name="D:glm.f32vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1845">
Single-qualifier floating-point vector of 3 components.
@see gtc_type_precision
</member>
<member name="D:glm.f32vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1849">
Single-qualifier floating-point vector of 4 components.
@see gtc_type_precision
</member>
<member name="D:glm.f64vec1" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1854">
Double-qualifier floating-point vector of 1 component.
@see gtc_type_precision
</member>
<member name="D:glm.f64vec2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1858">
Double-qualifier floating-point vector of 2 components.
@see gtc_type_precision
</member>
<member name="D:glm.f64vec3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1862">
Double-qualifier floating-point vector of 3 components.
@see gtc_type_precision
</member>
<member name="D:glm.f64vec4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1866">
Double-qualifier floating-point vector of 4 components.
@see gtc_type_precision
</member>
<member name="D:glm.fmat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1875">
Single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1883">
Single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1887">
Single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1892">
Single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1900">
Single-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1904">
Single-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1908">
Single-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1912">
Single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1916">
Single-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1920">
Single-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1924">
Single-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.fmat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1928">
Single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1933">
Single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1941">
Single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1945">
Single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1950">
Single-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Single-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1958">
Single-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1962">
Single-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1966">
Single-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1970">
Single-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1974">
Single-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1978">
Single-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1982">
Single-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1986">
Single-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="1993">
Double-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Double-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2001">
Double-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2005">
Double-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat2x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2010">
Double-qualifier floating-point 1x1 matrix.
@see gtc_type_precision
Double-qualifier floating-point 2x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat2x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2018">
Double-qualifier floating-point 2x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat2x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2022">
Double-qualifier floating-point 2x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat3x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2026">
Double-qualifier floating-point 3x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat3x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2030">
Double-qualifier floating-point 3x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat3x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2034">
Double-qualifier floating-point 3x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat4x2" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2038">
Double-qualifier floating-point 4x2 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat4x3" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2042">
Double-qualifier floating-point 4x3 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f64mat4x4" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2046">
Double-qualifier floating-point 4x4 matrix.
@see gtc_type_precision
</member>
<member name="D:glm.f32quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2055">
Single-qualifier floating-point quaternion.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f32quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2059">
Low single-qualifier floating-point quaternion.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_f64quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2063">
Low double-qualifier floating-point quaternion.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f32quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2067">
Medium single-qualifier floating-point quaternion.
@see gtc_type_precision
</member>
<member name="D:glm.mediump_f64quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2073">
Medium double-qualifier floating-point quaternion.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f32quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2077">
High single-qualifier floating-point quaternion.
@see gtc_type_precision
</member>
<member name="D:glm.highp_f64quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2081">
High double-qualifier floating-point quaternion.
@see gtc_type_precision
</member>
<member name="D:glm.f64quat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtc\type_precision.hpp" line="2085">
Double-qualifier floating-point quaternion.
@see gtc_type_precision
</member>
<member name="D:glm.lowp_dualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="184">
Dual-quaternion of low single-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.mediump_dualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="189">
Dual-quaternion of medium single-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.highp_dualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="194">
Dual-quaternion of high single-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.lowp_fdualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="200">
Dual-quaternion of low single-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.mediump_fdualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="205">
Dual-quaternion of medium single-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.highp_fdualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="210">
Dual-quaternion of high single-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.lowp_ddualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="216">
Dual-quaternion of low double-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.mediump_ddualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="221">
Dual-quaternion of medium double-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.highp_ddualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="226">
Dual-quaternion of high double-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.dualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="233">
Dual-quaternion of floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.fdualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="238">
Dual-quaternion of single-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="D:glm.ddualquat" decl="false" source="C:\vcpkg\vcpkg\installed\x64-windows\include\glm\gtx\dual_quaternion.hpp" line="257">
Dual-quaternion of default double-qualifier floating-point numbers.

@see gtx_dual_quaternion
</member>
<member name="T:UnitTestLibraryDesktop.Foo" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\UnitTest.Library.Desktop\Foo.h" line="9">
<summary>
A Foo class, used for testing 
</summary>
</member>
<member name="M:UnitTestLibraryDesktop.Foo.#ctor(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\UnitTest.Library.Desktop\Foo.h" line="17">
<summary>
Default constructor for Foo.
</summary>
<summary>
Constructor to set all data members.
</summary>
<param name="data">The data we want to set mData to.</param>
</member>
<member name="M:UnitTestLibraryDesktop.Foo.#ctor(UnitTestLibraryDesktop.Foo!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\UnitTest.Library.Desktop\Foo.h" line="28">
<summary>
Instantiates a Foo from an existing one 
</summary>
<param name="other"></param>
</member>
<member name="M:UnitTestLibraryDesktop.Foo.op_Assign(UnitTestLibraryDesktop.Foo!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\UnitTest.Library.Desktop\Foo.h" line="34">
<summary>
Assigns an already already Instantiated Foo to another 
</summary>
<param name="other">The rhs of the assignment (Foo we want to assign to this class).</param>
<returns></returns>
</member>
<member name="M:UnitTestLibraryDesktop.Foo.Data" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\UnitTest.Library.Desktop\Foo.h" line="42">
<summary>
Gets the private member mData.
</summary>
<returns>Returns a reference to this classes mData.</returns>
</member>
<member name="M:UnitTestLibraryDesktop.Foo.Data" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\UnitTest.Library.Desktop\Foo.h" line="48">
<summary>
Gets the private member mData.
</summary>
<returns>Returns a constant reference to this classes mData.</returns>
</member>
<member name="M:UnitTestLibraryDesktop.Foo.op_Equality(UnitTestLibraryDesktop.Foo!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\UnitTest.Library.Desktop\Foo.h" line="54">
<summary>
Compares one Foo to another to check if they are the same (data members are the same). 
</summary>
<param name="rhs">The Foo we are comparing with this Foo.</param>
<returns>Boolean to whether the Foos are equivalent.</returns>
</member>
<member name="M:UnitTestLibraryDesktop.Foo.op_Inequality(UnitTestLibraryDesktop.Foo!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\UnitTest.Library.Desktop\Foo.h" line="61">
<summary>
Compares one Foo to another to check if they are NOT the same (data members arent the same).
</summary>
<param name="rhs">The Foo we are comparing with this Foo.</param>
<returns>Boolean to whether the Foos are equivalent.</returns>
</member>
<member name="T:FieaGameEngine.DatumTypes" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="13">
<summary>
Enum class of the types that can be stored in the Datum
</summary>
</member>
<member name="T:FieaGameEngine.Datum" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="33">
<summary>
Datum is a Vector that determines its type at runtime.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="42">
<summary>
Constructor for a Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.DatumTypes,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="46">
<summary>
Constructor for a datum that takes in a type and an optional capacity (defaults to 10).
</summary>
<param name="type">Type for the Datum.</param>
<param name="capacity">Capacity of Datum.</param>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="53">
<summary>
Assigns an already instantiated Datum to another instantiated Datum.
</summary>
<param name="otherDatum">The Datum we are assigning to this one.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(System.Int32!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="60">
<summary>
Scalar assignment for an int to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The integer value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="67">
<summary>
Scalar assignment for a float to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The float value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="74">
<summary>
Scalar assignment for a math vector to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The vector (of 4 floats) value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="81">
<summary>
Scalar assignment for a math matrix to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The matrix (of 16 floats) value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="88">
<summary>
Scalar assignment for a string to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The string value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="95">
<summary>
Scalar assignment for a Run Time Type Information pointer to a datum. Sets the first element in the datum to the passed in value.
</summary>
<param name="value">The Run Time Type Information pointer value.</param>
<returns>A reference to a Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Dispose" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="103">
<summary>
Destructor for a Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="108">
<summary>
Instantiates a Datum from another one, by copy.
</summary>
<param name="value">The other Datum.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(System.Int32!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="114">
<summary>
Instantiates a Datum from a scalar int.
</summary>
<param name="value">the int value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(System.Single!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="120">
<summary>
Instantiates a Datum from a scalar float.
</summary>
<param name="value">the float value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="126">
<summary>
Instantiates a Datum from a scalar math vector.
</summary>
<param name="value">the math vector value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="132">
<summary>
Instantiates a Datum from a scalar math matrix.
</summary>
<param name="value">the math matrix value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="138">
<summary>
Instantiates a Datum from a scalar string.
</summary>
<param name="value">the string value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="144">
<summary>
Instantiates a Datum from a scalar Run Time Type Information pointer.
</summary>
<param name="value">the Run Time Type Information pointer value.</param>
</member>
<member name="M:FieaGameEngine.Datum.#ctor(FieaGameEngine.Datum*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="151">
<summary>
Move copy for a Datum.
</summary>
<param name="otherDatum">The other Datum.</param>
</member>
<member name="M:FieaGameEngine.Datum.op_Assign(FieaGameEngine.Datum*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="157">
<summary>
Move assignment for a Datum.
</summary>
<param name="otherDatum">The other Datum.</param>
<returns>A reference to this Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Type" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="164">
<summary>
Returns the type the Datum is.
</summary>
<returns>A constant Datum Type.</returns>
</member>
<member name="M:FieaGameEngine.Datum.SetType(FieaGameEngine.DatumTypes)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="170">
<summary>
Sets the type of the Datum.
</summary>
<param name="type">the type to set the Datum to.</param>
</member>
<member name="M:FieaGameEngine.Datum.Size" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="176">
<summary>
Gets the size of the Datum.
</summary>
<returns>A unsigned integer of the size.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Capacity" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="182">
<summary>
Gets the capacity of the Datum.
</summary>
<returns>A unsigned integer of the capacity.</returns>
</member>
<member name="M:FieaGameEngine.Datum.IsEmpty" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="188">
<summary>
Returns a bool as to whether the Datum is empty or not.
</summary>
<returns>a bool as to whether the Datum is empty or now.</returns>
</member>
<member name="M:FieaGameEngine.Datum.IsExternal" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="194">
<summary>
Returns a bool as to whether the Datum is external or not.
</summary>
<returns>a bool as to whether the Datum is external or now.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Resize(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="200">
<summary>
Resizes the Datum to the passed in size. Can shrink or grow the Datum.
</summary>
<param name="size">The unsigned int to resize to.</param>
</member>
<member name="M:FieaGameEngine.Datum.Reserve(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="206">
<summary>
Reserves space to the passed in size, cannot shrink the Datum.
</summary>
<param name="capacity">The unsigned int to resize to.</param>
</member>
<member name="M:FieaGameEngine.Datum.ShrinkToFit" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="212">
<summary>
Shrinks the Datum to the current size.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.Clear" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="217">
<summary>
Clear all elements in the Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(System.Int32*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="222">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an integer(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(System.Single*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="229">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an float(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="236">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an math vector(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="243">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an math matrix(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="250">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an string(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetStorage(FieaGameEngine.RTTI**,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="257">
<summary>
Sets the storage to external for the Datum.
</summary>
<param name="list">Pointer to an Run Time Type Information pointer(or many)</param>
<param name="numElements">The number of elements.</param>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="264">
<summary>
Equivalence comparison for Datums.
</summary>
<param name="otherDatum">The Datum we are equating to.</param>
<returns>bool as to whether they are the equivelent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="271">
<summary>
Equivalence comparison for an int. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The int we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="278">
<summary>
Equivalence comparison for a float. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The float we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="285">
<summary>
Equivalence comparison for a math vector. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math vector we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="292">
<summary>
Equivalence comparison for a math matrix. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math matrix we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="299">
<summary>
Equivalence comparison for a string. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The string we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Equality(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="306">
<summary>
Equivalence comparison for a Run Time Type Information pointer. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The Run Time Type Information pointer we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(FieaGameEngine.Datum!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="313">
<summary>
Non-Equivalence comparison for Datums.
</summary>
<param name="otherDatum">The Datum we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="320">
<summary>
Non-Equivalence comparison for an int. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The int we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="327">
<summary>
Non-Equivalence comparison for a float. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The float we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="334">
<summary>
Non-Equivalence comparison for a math vector. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math vector we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="341">
<summary>
Non-Equivalence comparison for a math matrix. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The math matrix we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="348">
<summary>
Equivalence comparison for a string. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The string we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.op_Inequality(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="355">
<summary>
Equivalence comparison for a Run Time Type Information pointer. Compares the first value of the Datum.
</summary>
<param name="otherDatum">The Run Time Type Information pointer we are equating to.</param>
<returns>bool as to whether they are the equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Set(System.Int32,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="366">
<summary>
Sets the given int value to the given index of the Datum.
</summary>
<param name="value">The int value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(System.Single,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="373">
<summary>
Sets the given float value to the given index of the Datum.
</summary>
<param name="value">The float value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="380">
<summary>
Sets the given math vector value to the given index of the Datum.
</summary>
<param name="value">The math vector value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="387">
<summary>
Sets the given math matrix value to the given index of the Datum.
</summary>
<param name="value">The math matrix value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="394">
<summary>
Sets the given string value to the given index of the Datum.
</summary>
<param name="value">The string value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.Set(FieaGameEngine.RTTI*,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="401">
<summary>
Sets the given Run Time Type Information pointer value to the given index of the Datum.
</summary>
<param name="value">The Run Time Type Information pointer value</param>
<param name="index">The index.</param>
</member>
<member name="M:FieaGameEngine.Datum.SetFromString(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="424">
<summary>
Converts the given string value to the appropriate type, and sets that value to the given index's value of the Datum.
</summary>
<param name="string">The string to set.</param>
<param name="index">The index to set at.</param>
</member>
<member name="M:FieaGameEngine.Datum.ToString(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="431">
<summary>
Converts the value at the given index (defaults to 0) to a String of appropriate type.
</summary>
<param name="index">The index whose value we are converting to a string.</param>
<returns>The converted string.</returns>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(System.Int32!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="438">
<summary>
Pushes the int value to the back of the Datum.
</summary>
<param name="value">The int value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(System.Single!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="444">
<summary>
Pushes the float value to the back of the Datum.
</summary>
<param name="value">The float value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="450">
<summary>
Pushes the math vector value to the back of the Datum.
</summary>
<param name="value">The math vector value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="456">
<summary>
Pushes the math matrix value to the back of the Datum.
</summary>
<param name="value">The math matrix value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="462">
<summary>
Pushes the string value to the back of the Datum.
</summary>
<param name="value">The string value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PushBack(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="468">
<summary>
Pushes the Run Time Type Information pointer value to the back of the Datum.
</summary>
<param name="value">The Run Time Type Information pointer value.</param>
</member>
<member name="M:FieaGameEngine.Datum.PopBack" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="475">
<summary>
Removes the last element of the Datum.
</summary>
</member>
<member name="M:FieaGameEngine.Datum.Remove(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="504">
<summary>
Removes the given int value from Datum if it exists in the Datum.
</summary>
<param name="value">The int value to remove.</param>
<returns>A Boolean as to whether the int value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="511">
<summary>
Removes the given float value from Datum if it exists in the Datum.
</summary>
<param name="value">The float value to remove.</param>
<returns>A Boolean as to whether the float value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="518">
<summary>
Removes the given math vector value from Datum if it exists in the Datum.
</summary>
<param name="value">The math vector value to remove.</param>
<returns>A Boolean as to whether the math vector value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="525">
<summary>
Removes the given math matrix value from Datum if it exists in the Datum.
</summary>
<param name="value">The math matrix value to remove.</param>
<returns>A Boolean as to whether the math matrix value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="532">
<summary>
Removes the given string value from Datum if it exists in the Datum.
</summary>
<param name="value">The string value to remove.</param>
<returns>A Boolean as to whether the string value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Remove(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="539">
<summary>
Removes the given Run Time Type Information pointer value from Datum if it exists in the Datum.
</summary>
<param name="value">The Run Time Type Information pointer value to remove.</param>
<returns>A Boolean as to whether the Run Time Type Information pointer value was removed or not.</returns>
</member>
<member name="M:FieaGameEngine.Datum.RemoveAt(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="548">
<summary>
Removes the value at the given index (defaults to 0).
</summary>
<param name="index">The index to remove at.</param>
</member>
<member name="M:FieaGameEngine.Datum.Find(System.Int32)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="554">
<summary>
Finds the given int value in the Datum. 
</summary>
<param name="value">The int value.</param>
<returns>A pair type of: boolean as to whether the int value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(System.Single)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="561">
<summary>
Finds the given float value in the Datum. 
</summary>
<param name="value">The float value.</param>
<returns>A pair type of: boolean as to whether the float value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(glm.vec&lt;0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="568">
<summary>
Finds the given math vector value in the Datum. 
</summary>
<param name="value">The math vector value.</param>
<returns>A pair type of: boolean as to whether the math vector value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(glm.mat&lt;0x4,0x4,System.Single,glm::packed_highp&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="575">
<summary>
Finds the given math matrix value in the Datum. 
</summary>
<param name="value">The math matrix value.</param>
<returns>A pair type of: boolean as to whether the math matrix value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="582">
<summary>
Finds the given string value in the Datum. 
</summary>
<param name="value">The string value.</param>
<returns>A pair type of: boolean as to whether the string value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="M:FieaGameEngine.Datum.Find(FieaGameEngine.RTTI*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Datum.h" line="589">
<summary>
Finds the given Run Time Type Information pointer value in the Datum. 
</summary>
<param name="value">The Run Time Type Information pointer value.</param>
<returns>A pair type of: boolean as to whether the Run Time Type Information pointer value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
</member>
<member name="T:FieaGameEngine.Scope" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="10">
<summary>
A Container to hold Key, datum pairs. Think of this as a c++ Struct. 
</summary>
</member>
<member name="M:FieaGameEngine.Scope.#ctor(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="26">
<summary>
Constructor for Scope that takes in an optional size to allocate to, default is 11.
</summary>
<param name="size">The size to allocate.</param>
</member>
<member name="M:FieaGameEngine.Scope.#ctor(std.initializer_list&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;&gt;)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="32">
<summary>
Initializer list for Scope, takes in a key, and calls Append on the Scope with the appropriate key
</summary>
<param name="list">list of keys.</param>
</member>
<member name="M:FieaGameEngine.Scope.Dispose" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="38">
<summary>
Destructor for Scope, destroys any heap allocated memory. 
</summary>
</member>
<member name="M:FieaGameEngine.Scope.#ctor(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="43">
<summary>
Copy Constructor for Scope, copy's an already instantiated Scope to this one.
</summary>
<param name="other">The other pre instantated Scope.</param>
</member>
<member name="M:FieaGameEngine.Scope.op_Assign(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="49">
<summary>
Copy Assignment for Scope, copy's an already instantiated Scope to another already instantiated Scope.
</summary>
<param name="other">The other pre instantiated Scope.</param>
<returns>A refrence to the Scope.</returns>
</member>
<member name="M:FieaGameEngine.Scope.#ctor(FieaGameEngine.Scope*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="56">
<summary>
Move Constructor for Scope, Moves an already instantiated Scope to this one.
</summary>
<param name="other">The other pre instantated Scope.</param>
</member>
<member name="M:FieaGameEngine.Scope.op_Assign(FieaGameEngine.Scope*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="62">
<summary>
Move Assignment for Scope, Moves an already instantiated Scope to another already instantiated Scope.
</summary>
<param name="other">The other pre instantated Scope.</param>
<returns>A reference to the Scope.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Subscript(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="69">
<summary>
Operator bracket that takes in a string to find in the current Scope, wraps Append. 
</summary>
<param name="string">The key to find in the current Scope.</param>
<returns>A reference to the found (or newly created) Datum.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Subscript(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="76">
<summary>
Operator bracket that takes in an index to get a Datum at. Will throw out of bounds error. 
</summary>
<param name="index">The index to find the Datum in the current Scope.</param>
<returns>A reference to the found Datum.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Subscript(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="83">
<summary>
Const version of Operator bracket that takes in an index to get a Datum at. Will throw out of bounds error. 
</summary>
<param name="index">The index to find the Datum in the current Scope.</param>
<returns>A constant reference to the found Datum.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Equality(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="90">
<summary>
Equality operator for Scope, compares this scope to the passed in Scope. Returns true if they are equivalent Scopes.
</summary>
<param name="other">The Scope we are comparing to this one.</param>
<returns>A boolean as to wheter the two Scopes are equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Scope.op_Inequality(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="97">
<summary>
Not Equal operator for scope, compares this scope to the passed in Scope. Returns true if they are not equivalent Scopes.
</summary>
<param name="other">The Scope we are comparing to this one.</param>
<returns>A boolean as to wheter the two Scopes are not equivalent.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Find(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="104">
<summary>
Finds the passed in key (string) in the current Scope.
</summary>
<param name="string">The key (string) we are trying to find in this Scope.</param>
<returns>Returns the address of the found Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Find(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="111">
<summary>
Const version of Find, Finds the passed in key (string) in the current Scope.
</summary>
<param name="string">The key (string) we are trying to find in this Scope.</param>
<returns>Returns the address of the found (constant) Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Search(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="118">
<summary>
Searches for the given key (string), in this Scope, and recursively up its parents.
</summary>
<param name="string">The key (string) we are trying to search for. </param>
<returns>Returns the address of the found Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Search(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,FieaGameEngine.Scope**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="125">
<summary>
Search that takes in an key to find and a reference to a Scope pointer. This reference contains the address of the Scope object with the contained key.
</summary>
<param name="string">The key (string) we are trying to search for</param>
<param name="scope">A reference to a Scope*</param>
<returns>Returns the address of the found Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Search(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="133">
<summary>
Const version of Search, Searches for the given key (string), in this Scope, and recursively up its parents.
</summary>
<param name="string">The key (string) we are trying to search for. </param>
<returns>Returns the address of the found (constant) Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Search(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="140">
<summary>
Const version of Search that takes in an key to find and a reference to a Scope pointer. This reference contains the address of the Scope object with the contained key.
</summary>
<param name="string">The key (string) we are trying to search for</param>
<param name="scope">A reference to a Scope*</param>
<returns>Returns the address of the found (constant) Datum, nullptr if it wasnt found.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Append(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="152">
<summary>
Creates a key Datum pair with the given Scope if the key doesnt exist and returns a reference to that Datum, otherwise it returns a reference to the already existing Datum.
The Datum is Default constructed.
</summary>
<param name="string">The key to Append in the Scope.</param>
<returns>A reference to the Appended/existing Datum.</returns>
</member>
<member name="M:FieaGameEngine.Scope.AppendScope(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="160">
<summary>
Appends a Scope to the given key, if the key exists and is of type Table, or Unkown. If the key doesnt exist create a new key Datum pair with the given key. 
</summary>
<param name="string">The key (string) we are trying to Append a Scope to.</param>
<returns>A reference to the Scope with the given key.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Adopt(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,FieaGameEngine.Scope*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="167">
<summary>
Adopts a Scope from another parent. It cannot be a descendant of the scope you are trying to Adopt to.
</summary>
<param name="string">The key (string) we are creating an enrty of.</param>
<returns>A reference to the child we are trying to Adopt.</returns>
</member>
<member name="M:FieaGameEngine.Scope.GetParent" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="174">
<summary>
Gets the parent of the current Scope.
</summary>
<returns>Returns the address of the parent.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Clear" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="180">
<summary>
Clears all entries stored in this Scope and Deletes any nested Scopes. 
</summary>
</member>
<member name="M:FieaGameEngine.Scope.FindContainedScope(FieaGameEngine.Scope*!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="185">
<summary>
Finds a Scope contained in this one. 
</summary>
<param name="scope">The contained Scope we are trying to find.</param>
<returns>A pair of Datum*(the address of the found Datum) and an index at which it was found in that Datum. </returns>
</member>
<member name="M:FieaGameEngine.Scope.IsAncestorOf(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="192">
<summary>
Checks to see if the passed in Scope is a descendant of this one.
</summary>
<param name="scope">The Scope we are querying.</param>
<returns>A boolean as to whether the passed in Scope is a descendant of this Scope.</returns>
</member>
<member name="M:FieaGameEngine.Scope.IsDescendantOf(FieaGameEngine.Scope!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="199">
<summary>
Checks to see if the passed in Scope is an ancestor of this one. 
</summary>
<param name="scope">he Scope we are querying.</param>
<returns>A boolean as to whether the passed in Scope is a ancestor of this Scope.</returns>
</member>
<member name="M:FieaGameEngine.Scope.Equals(FieaGameEngine.RTTI!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Scope.h" line="208">
<summary>
Equals override for an RTTI. Will cast if the given RTTI is really a Scope. Calls the Equality operator for Scopes.
</summary>
<param name="rhs">The other RTTI* we are comparing to this one</param>
<returns>a boolean as to whether the passed in RTTI* is equivalent to this Scope.</returns>
</member>
<member name="T:FieaGameEngine.Signature" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Signature.h" line="7">
<summary>
Signature class for setting up datums in attribute. 
</summary>
</member>
<member name="T:FieaGameEngine.Registry" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Registry.h" line="9">
<summary>
A singleton class that holds a registry of TypeId's to a vector of Signatures.
</summary>
</member>
<member name="M:FieaGameEngine.Registry.GetInstance" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Registry.h" line="16">
<summary>
Retrieves the instance of the singleton.
</summary>
<returns></returns>
</member>
<member name="M:FieaGameEngine.Registry.ClearRegistry" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Registry.h" line="36">
<summary>
Clears the Registry.
</summary>
</member>
<member name="M:FieaGameEngine.Attribute.#ctor(FieaGameEngine.Attribute!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="18">
<summary>
Copy constructor for Attribute.
</summary>
<param name="other">The otherAttribute</param>
</member>
<member name="M:FieaGameEngine.Attribute.op_Assign(FieaGameEngine.Attribute!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="24">
<summary>
Copy assignment operator for Attribute.
</summary>
<param name="other">the other Attribute</param>
<returns>A reference to this Attribute</returns>
</member>
<member name="M:FieaGameEngine.Attribute.#ctor(FieaGameEngine.Attribute*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="31">
<summary>
Move constructor for Attribute.
</summary>
<param name="other">The otherAttribute</param>
</member>
<member name="M:FieaGameEngine.Attribute.op_Assign(FieaGameEngine.Attribute*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="37">
<summary>
Move assignment operator for Attribute.
</summary>
<param name="other">the other Attribute</param>
<returns>A reference to this Attribute</returns>
</member>
<member name="M:FieaGameEngine.Attribute.AppendAuxiliaryAttribute(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="44">
<summary>
Appends an auxiliary Attribute to the Scope.
</summary>
<param name="string">The "key" string we want to append.</param>
<returns>A reference to the newly appended Datum.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.IsAttribute(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="51">
<summary>
A bool as to whether the passed in "key" string is an Attribute.
</summary>
<param name="string">The "key" string we want to append.</param>
<returns>bool as to whether it is an Attribute or not.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.IsPrescribedAttribute(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="58">
<summary>
A bool as to whether the passed in "key" string is a prescribed Attribute (an attribute instantiated at initialization).
</summary>
<param name="string">The "key" string we want to append.</param>
<returns>bool as to whether it is a prescribed Attribute or not.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.IsAuxiliaryAttribute(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="65">
<summary>
A bool as to whether the passed in "key" string is an auxiliary Attribute (an attribute added at runtime).
</summary>
<param name="string">The "key" string we want to append.</param>
<returns>bool as to whether it is an Attribute or not.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.ToString" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="78">
<summary>
To string override for for Attribute.
</summary>
<returns>A string.</returns>
</member>
<member name="M:FieaGameEngine.Attribute.#ctor(System.UInt64)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Attribute.h" line="92">
<summary>
Constructor that takes in a typeID from the child class.
</summary>
<param name="childID">the childs typeID</param>
</member>
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
<member name="T:FieaGameEngine.ContextFrame" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="10">
<summary>
Context frame keeps the current context for scope parsing
</summary>
</member>
<member name="M:FieaGameEngine.ContextFrame.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,FieaGameEngine.Scope*,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="15">
<summary>
Constructor for ContextFrame. 
</summary>
<param name="currentKey">The current key.</param>
<param name="currentScope">The current Scope.</param>
</member>
<member name="T:FieaGameEngine.JsonTableParseHelper" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="30">
<summary>
Helper class for dealing with Scopes. 
</summary>
</member>
<member name="T:FieaGameEngine.JsonTableParseHelper.SharedData" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="38">
<summary>
Wrapper class that maintains the data read in from the JSON. 
</summary>
</member>
<member name="M:FieaGameEngine.JsonTableParseHelper.SharedData.#ctor(FieaGameEngine.Scope*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="45">
<summary>
Constructor for SharedData. 
</summary>
<param name="scope">The scope you want to push to.</param>
</member>
<member name="M:FieaGameEngine.JsonTableParseHelper.SharedData.Initialize" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="51">
<summary>
Initializes data.
</summary>
</member>
<member name="M:FieaGameEngine.JsonTableParseHelper.SharedData.Cleanup" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="56">
<summary>
Cleans up any Initialized data.
</summary>
</member>
<member name="M:FieaGameEngine.JsonTableParseHelper.SharedData.Create" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="61">
<summary>
Creates a new SharedData pointer, the user is responsible for deleting it
</summary>
<returns>A gsl owner to the SharedData pointer.</returns>
</member>
<member name="M:FieaGameEngine.JsonTableParseHelper.Create" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="72">
<summary>
Creates a new IJsonParseHelper pointer, the user is responsible for deleting it
</summary>
<returns>A gsl owner to the IJsonParseHelper pointer.</returns>
</member>
<member name="M:FieaGameEngine.JsonTableParseHelper.Initialize" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="78">
<summary>
Initializes any needed data in this helper.
</summary>
</member>
<member name="M:FieaGameEngine.JsonTableParseHelper.Cleanup" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="83">
<summary>
Cleanups any Initialized data in this helper.
</summary>
</member>
<member name="M:FieaGameEngine.JsonTableParseHelper.StartHandler(FieaGameEngine.JsonParseCoordinator.SharedData*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt64!System.Runtime.CompilerServices.IsConst)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="88">
<summary>
Starts the handler for the JsonValue parsed in.
</summary>
<param name="sharedData">A reference to the SharedData.</param>
<param name="key">The key in the value pair for parsing.</param>
<param name="value">The JsonValue corresponding to the key.</param>
<returns></returns>
</member>
<member name="M:FieaGameEngine.JsonTableParseHelper.EndHandler(FieaGameEngine.JsonParseCoordinator.SharedData*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Json.Value!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\JsonTableParseHelper.h" line="97">
<summary>
Ends the handler for the JsonValue being parsed.
</summary>
<param name="sharedData">A reference to the SharedData.</param>
<param name="key">The key in the value pair for parsing.</param>
<param name="value">The JsonValue corresponding to the key.</param>
<returns></returns>
</member>
<member name="T:FieaGameEngine.Action" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Action.h" line="8">
<summary>
Abstract base class for Action.s
</summary>
</member>
<member name="M:FieaGameEngine.Action.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Action.h" line="21">
<summary>
Pure virtual update, overridden in the child classes.
</summary>
<param name="gameTime">A GameTIme instance</param>
</member>
<member name="M:FieaGameEngine.Action.Signatures" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\Action.h" line="30">
<summary>
The vector of Signatures, becomes the prescribed Attributes of the GameObject. 
</summary>
<returns></returns>
</member>
<member name="T:FieaGameEngine.Transform" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="10">
<summary>
Transform class holds the position, rotation, and scale of the GameObject
</summary>
</member>
<member name="M:FieaGameEngine.Transform.op_Equality(FieaGameEngine.Transform!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="15">
<summary>
Compares two Transforms to see if they are equal.
</summary>
<param name="rhs">The other Transform</param>
<returns>A boolean as to wheter they are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.Transform.op_Inequality(FieaGameEngine.Transform!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="26">
<summary>
Compares two Transforms to see if they are not equal.
</summary>
<param name="rhs">The other Transform</param>
<returns>A boolean as to whether they are equal or not.</returns>
</member>
<member name="T:FieaGameEngine.GameObject" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="40">
<summary>
GameObject class extends Attribute, base class for any object we want to make in the game.
</summary>
</member>
<member name="M:FieaGameEngine.GameObject.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="48">
<summary>
Default constructor for GameObject, Calls Attributes Constructor.
</summary>
</member>
<member name="M:FieaGameEngine.GameObject.op_Equality(FieaGameEngine.GameObject!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="58">
<summary>
Compares that two game objects are equivalent. 
</summary>
<param name="otherGameObject">The other GameObject</param>
<returns>A boolean as to whether the two GameObjects are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.GameObject.op_Inequality(FieaGameEngine.GameObject!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="68">
<summary>
Compares that two game objects are not equivalent. 
</summary>
<param name="otherGameObject">The other GameObject</param>
<returns>A boolean as to whether the two GameObjects are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.GameObject.Actions" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="78">
<summary>
Getter for the Datum of Actions.
</summary>
<returns>A const Datum pointer to the Actions Datum.</returns>
</member>
<member name="M:FieaGameEngine.GameObject.CreateAction(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="84">
<summary>
Creates a new Action on the Actions Datum, wraps Adopt. 
</summary>
<param name="className">The name of the Factory class you want to create.</param>
<param name="instanceName">The name of the instance you want to add to the Class Name's datum.</param>
</member>
<member name="M:FieaGameEngine.GameObject.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="91">
<summary>
Updates this GameObject and calls update on all of its children.
</summary>
<param name="gameTime">A constant reference to a GameTime object.</param>
</member>
<member name="M:FieaGameEngine.GameObject.Clone" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="97">
<summary>
Clones this GameObject, makes a copy that the user is responsible for deleting.
</summary>
<returns>A pointer to a GameObject, the user is responsible for deleting it.</returns>
</member>
<member name="M:FieaGameEngine.GameObject.Equals(FieaGameEngine.RTTI!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="103">
<summary>
Compares two GameObjects to see if they are equal. Calls the operator== for GameObject
</summary>
<param name="rhs">The other RTTI pointer.</param>
<returns>A boolean as to whether they are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.GameObject.ToString" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="110">
<summary>
Converts the GameObject to a string.
</summary>
<returns>A string.</returns>
</member>
<member name="M:FieaGameEngine.GameObject.Signatures" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\GameObject.h" line="116">
<summary>
The vector of signatures, becomes the prescribed Attributes of the GameObject. 
</summary>
<returns></returns>
</member>
<member name="T:FieaGameEngine.ActionList" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionList.h" line="5">
<summary>
Holds a list of Actions.
</summary>
</member>
<member name="M:FieaGameEngine.ActionList.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionList.h" line="13">
<summary>
Default constructor for ActionList, calls Actions Constructor.
</summary>
</member>
<member name="M:FieaGameEngine.ActionList.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionList.h" line="23">
<summary>
Update for ActionList, calls update on all nested Actions.
</summary>
<param name="gameTime">A GameTime instance.</param>
</member>
<member name="M:FieaGameEngine.ActionList.Clone" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionList.h" line="31">
<summary>
Clones this ActionList, makes a copy that the user is responsible for deleting.
</summary>
<returns>A pointer to a ActionList, the user is responsible for deleting it.</returns>
</member>
<member name="M:FieaGameEngine.ActionList.Equals(FieaGameEngine.RTTI!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionList.h" line="37">
<summary>
Compares two ActionList to see if they are equal.
</summary>
<param name="rhs">The other RTTI pointer.</param>
<returns>A boolean as to whether they are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.ActionList.ToString" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionList.h" line="44">
<summary>
Converts the ActionList to a string.
</summary>
<returns>A string.</returns>
</member>
<member name="M:FieaGameEngine.ActionList.Signatures" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionList.h" line="50">
<summary>
Vector of Signatures for ActionList.
</summary>
<returns>The Vector of Signatures.</returns>
</member>
<member name="T:FieaGameEngine.ActionListIf" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionListIf.h" line="5">
<summary>
Action that deals with If statements.
</summary>
</member>
<member name="M:FieaGameEngine.ActionListIf.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionListIf.h" line="12">
<summary>
Default constructor for ActionListIf, calls ActionLists Constructor.
</summary>
</member>
<member name="M:FieaGameEngine.ActionListIf.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionListIf.h" line="22">
<summary>
Update for ActionListIf, calls the appropriate action given the result of the condition
</summary>
<param name="gameTime">A AameTime instance.</param>
</member>
<member name="M:FieaGameEngine.ActionListIf.GetCondition" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionListIf.h" line="28">
<summary>
Gets the Condition.
</summary>
<returns>The Condition.</returns>
</member>
<member name="M:FieaGameEngine.ActionListIf.SetCondition(System.Boolean)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionListIf.h" line="34">
<summary>
Sets the condition to the given result.
</summary>
<param name="conditionResult">The result to set the Condition to.</param>
</member>
<member name="M:FieaGameEngine.ActionListIf.Clone" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionListIf.h" line="40">
<summary>
Clones this ActionListIf, makes a copy that the user is responsible for deleting.
</summary>
<returns>A pointer to a ActionListIf, the user is responsible for deleting it.</returns>
</member>
<member name="M:FieaGameEngine.ActionListIf.Equals(FieaGameEngine.RTTI!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionListIf.h" line="46">
<summary>
Compares two ActionListIf to see if they are equal.
</summary>
<param name="rhs">The other RTTI pointer.</param>
<returns>A boolean as to whether they are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.ActionListIf.ToString" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionListIf.h" line="53">
<summary>
Converts the ActionListIf to a string.
</summary>
<returns>A string.</returns>
</member>
<member name="M:FieaGameEngine.ActionListIf.Signatures" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionListIf.h" line="59">
<summary>
Vector of Signatures for ActionListIf.
</summary>
<returns>The Vector of Signatures.</returns>
</member>
<member name="T:FieaGameEngine.ActionCreateAction" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionCreateAction.h" line="5">
<summary>
Creates Actions to put in the container.
</summary>
</member>
<member name="M:FieaGameEngine.ActionCreateAction.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionCreateAction.h" line="14">
<summary>
Default constructor for ActionCreateAction, calls Actions Constructor.
</summary>
</member>
<member name="M:FieaGameEngine.ActionCreateAction.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionCreateAction.h" line="25">
<summary>
Update for ActionCreateAction, adds an Action to a list of Actions to create, creation is controlled by GameState.
</summary>
<param name="gameTime">A GameTime instance.</param>
</member>
<member name="M:FieaGameEngine.ActionCreateAction.Clone" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionCreateAction.h" line="31">
<summary>
Clones this ActionCreateAction, makes a copy that the user is responsible for deleting.
</summary>
<returns>A pointer to a ActionCreateAction, the user is responsible for deleting it.</returns>
</member>
<member name="M:FieaGameEngine.ActionCreateAction.Equals(FieaGameEngine.RTTI!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionCreateAction.h" line="37">
<summary>
Compares two ActionCreateAction to see if they are equal.
</summary>
<param name="rhs">The other RTTI pointer.</param>
<returns>A boolean as to whether they are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.ActionCreateAction.ToString" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionCreateAction.h" line="44">
<summary>
Converts the ActionCreateAction to a string.
</summary>
<returns>A string.</returns>
</member>
<member name="M:FieaGameEngine.ActionCreateAction.Signatures" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionCreateAction.h" line="50">
<summary>
Vector of Signatures for ActionCreateAction.
</summary>
<returns>The Vector of Signatures.</returns>
</member>
<member name="T:FieaGameEngine.ActionDestroyAction" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionDestroyAction.h" line="5">
<summary>
Destroys a designated Action.
</summary>
</member>
<member name="M:FieaGameEngine.ActionDestroyAction.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionDestroyAction.h" line="13">
<summary>
Default constructor for ActionDestroyAction, calls Actions Constructor.
</summary>
</member>
<member name="M:FieaGameEngine.ActionDestroyAction.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionDestroyAction.h" line="23">
<summary>
Update for ActionDestroyAction, adds an Action to a list of actions to destroy, actual deletion of the action controlled by GameState.
</summary>
<param name="gameTime">A GameTime instance.</param>
</member>
<member name="M:FieaGameEngine.ActionDestroyAction.Clone" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionDestroyAction.h" line="29">
<summary>
Clones this ActionDestroyAction, makes a copy that the user is responsible for deleting.
</summary>
<returns>A pointer to a ActionDestroyAction, the user is responsible for deleting it.</returns>
</member>
<member name="M:FieaGameEngine.ActionDestroyAction.Equals(FieaGameEngine.RTTI!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionDestroyAction.h" line="35">
<summary>
Compares two ActionDestroyAction to see if they are equal.
</summary>
<param name="rhs">The other RTTI pointer.</param>
<returns>A boolean as to whether they are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.ActionDestroyAction.ToString" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionDestroyAction.h" line="42">
<summary>
Converts the ActionDestroyAction to a string.
</summary>
<returns>A string.</returns>
</member>
<member name="M:FieaGameEngine.ActionDestroyAction.Signatures" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionDestroyAction.h" line="48">
<summary>
Vector of Signatures for ActionDestroyAction.
</summary>
<returns>The Vector of Signatures.</returns>
</member>
<member name="T:FieaGameEngine.ActionIncrement" decl="false" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="6">
<summary>
Action that increments the value of a target datum (works for int and floats)
</summary>
</member>
<member name="M:FieaGameEngine.ActionIncrement.#ctor" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="13">
<summary>
Default constructor for ActionIncrement, calls Actions Constructor.
</summary>
</member>
<member name="M:FieaGameEngine.ActionIncrement.GetTarget" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="24">
<summary>
Gets the Target string name.
</summary>
<returns>The name of the Target.</returns>
</member>
<member name="M:FieaGameEngine.ActionIncrement.SetTarget(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="30">
<summary>
Sets the name of the Target, resets the cached TargetDatum.
</summary>
<param name="_target"></param>
</member>
<member name="M:FieaGameEngine.ActionIncrement.Update(FieaGameEngine.GameTime!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="36">
<summary>
Update for ActionIncrement, trys to find the Target, and then increments the Targets Datum Value.
</summary>
<param name="gameTime">A GameTime instance.</param>
</member>
<member name="M:FieaGameEngine.ActionIncrement.Clone" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="42">
<summary>
Clones this ActionIncrement, makes a copy that the user is responsible for deleting.
</summary>
<returns>A pointer to a ActionList, the user is responsible for deleting it.</returns>
</member>
<member name="M:FieaGameEngine.ActionIncrement.Equals(FieaGameEngine.RTTI!System.Runtime.CompilerServices.IsConst*)" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="48">
<summary>
Compares two ActionIncrement to see if they are equal.
</summary>
<param name="rhs">The other RTTI pointer.</param>
<returns>A boolean as to whether they are equal or not.</returns>
</member>
<member name="M:FieaGameEngine.ActionIncrement.ToString" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="55">
<summary>
Converts the ActionIncrement to a string.
</summary>
<returns>A string.</returns>
</member>
<member name="M:FieaGameEngine.ActionIncrement.Signatures" decl="true" source="C:\Dev\Students\CH18\Nathan.Devereux\Prog2\FIEAGameEngine\source\Library.Shared\ActionIncrement.h" line="61">
<summary>
Vector of Signatures for ActionDestroyAction.
</summary>
<returns>The Vector of Signatures.</returns>
</member>
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