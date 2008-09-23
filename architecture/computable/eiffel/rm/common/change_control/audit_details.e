indexing
	component:   "openEHR Common Reference Model"

	description: "[
			 Generic details of an audit trail
			 ]"
	keywords:    "version control"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/common/change_control/SCCS/s.audit_details.e $"
	revision:    "$Revision: 1.1 $"
	last_change: "$Date: 03/11/14 14:08:13+00:00 $"

class AUDIT_DETAILS


feature -- Initialization

	make_audit_details(a_node: STRING; a_committer: PARTY_REF; a_time_committed: DV_DATE_TIME) is
		require
			a_node_valid: a_node /= Void and then not a_node.is_empty
			a_committer_valid: a_committer /= Void
			a_time_committed_valid: a_time_committed /= Void
		do
			node := a_node
			committer := a_committer
			time_committed := a_time_committed
		ensure
			node = a_node
			committer = a_committer
			time_committed = a_time_committed
		end

feature -- Access

	node: STRING	
			-- Identity of the node where the item was committed.

	committer: PARTY_REF	
			-- Identity of party who committed the item.

	time_committed: DV_DATE_TIME	
			-- Time of committal of the item.

invariant
	Node_exists: node /= Void and then not node.is_empty
	Committer_exists: committer /= Void
	Time_committed_exists: time_committed /= Void	

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
--| The Original Code is audit_details.e.
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