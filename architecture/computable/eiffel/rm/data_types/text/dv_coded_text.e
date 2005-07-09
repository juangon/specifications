indexing
	component:   "openEHR Data Types"

	description: "[
				 Text which is from a terminology, such as ICD10, ICPC, SNOMED or 
				 a terminology generated by a description logic-based ontology such as Galen
				 ]"
	keywords:    "term, text"

	requirements:"ISO 18308 TS V1.0 STR 4.1, 4.2, 4.3"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/text/SCCS/s.dv_coded_text.e $"
	revision:    "$Revision$"
	last_change: "$Date$"

class DV_CODED_TEXT
    
inherit
	DV_TEXT
		rename
			make as make_text
		redefine
			default_create, is_equal, as_canonical_string, as_string, valid_canonical_string,
			make_from_canonical_string, make_from_string
		end

create 
	default_create,
	make, make_from_string, make_from_canonical_string

feature -- Definitions

	Default_primary_code: STRING is "0"

	Default_primary_rubric: STRING is "unknown"
	
feature -- Initialization

	default_create is
		do
			precursor
			create defining_code.default_create
		end

	make (str: STRING; a_code: CODE_PHRASE) is
		require
			String_valid: str /= void and then not str.is_empty
			A_code_valid: a_code /= Void
		do
			value := str
			defining_code := a_code
		ensure
			Value_set: value = str
			Code_set: defining_code = a_code
		end

	make_from_string(str:STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
			-- make from a string of the form:
			--
			-- <value>xxxx</value>
			-- <language>
			-- 		<terminology_id>
			--			<name>string</name>
			-- 			[<version_id>string</version_id>]
			-- 		</terminology_id>
			-- 		<code_string>string</code_string>
			-- </language>
			-- <charset>
			-- 		<terminology_id>
			--			<name>string</name>
			-- 			[<version_id>string</version_id>]
			-- 		</terminology_id>
			-- 		<code_string>string</code_string>
			-- </charset>
			-- <defining_code>
			-- 		<terminology_id>
			--			<name>string</name>
			-- 			[<version_id>string</version_id>]
			-- 		</terminology_id>
			-- 		<code_string>string</code_string>
			-- </defining_code>
			-- [<hyperlink>DV_URI</hyperlink>]
			-- [<formatting>xxxx</formatting>]
			-- [<mappings>
			--		<item>
			-- 			<target>
			-- 				<terminology_id>
			--					<name>string</name>
			-- 					[<version_id>string</version_id>]
			-- 				</terminology_id>
			-- 				<code_string>string</code_string>
			-- 			</target>
			-- 			<match>character</match>
			-- 			[<purpose>DV_CODED_TEXT</purpose>]			
			--		</item>
			--		<item>...</item>
			-- <mappings>]
		do
			precursor(str)
			create defining_code.make_from_canonical_string(xml_extract_from_tags(str, "defining_code", 1))
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
			Result := precursor(str) and then xml_has_tag(str, "defining_code", 1)
		end

feature -- Access

	defining_code: CODE_PHRASE
			-- the (possibly coordinated) term from a terminology service whose rubric is the 'value' attribute

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- True if value and key are equal in this and `other'
		do
			Result := value.is_equal (other.value) and defining_code.is_equal(other.defining_code)
		end
	
	is_comparable (other: like Current): BOOLEAN is
			-- True if Current and other are both from same vocabulary; only really meaingiful
			-- for terms from same small vocabulary, i.e. a subset or value range
		require
			other /= Void
		do
			Result := defining_code.terminology_id.is_equal (other.defining_code.terminology_id)
		end

feature -- Output

	as_string: STRING is
			-- Result in same form as `value'
		do
			Result := precursor
			Result.append (defining_code.as_string)
		end

	as_canonical_string: STRING is
			-- Result in canonical form
		do
			Result := precursor 
			Result.append("<defining_code>" + defining_code.as_canonical_string + "</defining_code>")
		end
	
invariant
	Defining_code_exists: defining_code /= void

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is dv_coded_text.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
