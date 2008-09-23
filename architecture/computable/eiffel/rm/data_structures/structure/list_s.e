indexing
	component:   "openEHR Data Structures Reference Model"

	description: "[
	              A data structure in the form of a linear list.
				root:CLUSTER
					item_1: ELEMENT
					item_2: ELEMENT
					...	
					item_N: ELEMENT
		 
	              Valid paths are of the form:
	             	whole list: |<root-name>
	             
	             	nth list item: |<root-name>|item=<n>
	             	named list item: |<root-name>|<value name>
	             	
	             	nth list item: item=<n>
	             	named list item: <value name>
			  ]"
	keywords:    "content, spatial, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_structures/structure/SCCS/s.list_s.e $"
	revision:    "$Revision: 1.2 $"
	last_change: "$Date: 04/03/10 10:26:37+10:00 $"

class ITEM_LIST

inherit
	ITEM_STRUCTURE
		redefine
			representation
		end

feature -- Access

	representation: CLUSTER
			-- item containing list elements

	item_count: INTEGER is
			-- Count of all items
		do
		end

	items: LIST [ELEMENT]	is
			-- Retrieve all items
		do
		end

	names: LIST [DV_TEXT] is
			-- Retrieve the names of all items
		do
		end

	named_item(a_name:STRING): ELEMENT is
			-- Retrieve the item with name �a_name�
		do
		end

	ith_item(i:INTEGER): ELEMENT is
			-- Retrieve the i-th item with name
		require
			i >= 1 and i <= item_count
		do
		end

	path_of_item (a_loc: LOCATABLE): STRING is
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE is
			-- The item at a path (relative to this item).
		do
		end

feature -- Status Report

	valid_path (a_path: STRING): BOOLEAN is
			-- True if the path is valid with respect to the current item.
		do
		end

invariant
	-- Valid_structure: representation.items.forall(agent {ITEM}.type = "ELEMENT")

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
--| The Original Code is list_s.e.
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