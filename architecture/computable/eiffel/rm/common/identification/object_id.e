indexing
	component:   "openEHR Common Reference Model"
	
	description: "[
			 Ancestor class of identifiers of informational objects. Ids may be completely meaningless, 
			 in which case their only job is to refer to something, or may carry some information to do 
			 with the identified object.
			 ]"
	keywords:    "object identifiers"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/support/identification/SCCS/s.object_id.e $"
	revision:    "$Revision: 1.2 $"
	last_change: "$Date: 04/01/14 23:18:38+10:00 $"

deferred class OBJECT_ID

feature -- Access

	value: STRING
	
	version_id: STRING is
			-- extract the version id part of the id; can be empty
		deferred
		ensure
			Result /= Void
		end
		
feature -- Status Report

	valid_id(an_id:STRING): BOOLEAN is
			-- 
		require
			an_id_valid: an_id /= Void and then not an_id.is_empty
		deferred
			-- Result := 
		end
		
invariant
	value_exists: value /= Void and then not value.is_empty

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
--| The Original Code is object_id.e.
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