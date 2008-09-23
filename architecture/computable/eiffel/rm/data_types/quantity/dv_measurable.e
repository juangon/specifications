indexing
	component:   "openEHR Data Types"

	description: "[
			 Abstract type representing 'scientific' quantities, i.e. quantities expressed 
			 as a single value and a single, optional units.
			 ]"
	keywords:    "quantity, data"

	requirements:"ISO 18308 TS V1.0 STR 3.2 - 3.4"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/quantity/SCCS/s.dv_measurable.e $"
	revision:    "$Revision: 1.3 $"
	last_change: "$Date: 04/03/10 10:26:39+10:00 $"

deferred class DV_MEASURABLE

inherit
	DV_QUANTIFIED

	MEASUREMENT_SERVICE_ACCESS
		export 
			{NONE} all
		undefine
			is_equal
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		deferred
		end

feature -- Access

	units: STRING is
			-- stringified units, expressed in UCUM unit syntax, e.g. "kg/m2", �mm[Hg]", "ms-1", "km/h". 
		deferred
		end

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN is
			-- two quantities are strictly comparable if they are measuring the same property
			-- Ideally, we would allow different units within the same property, but there is
			-- no converter currently implemented, so we also require that the units are identical
		do
			Result := units_equivalent (units, other.units)
		ensure then
			units_equivalent (units, other.units) implies Result
		end

feature -- Output

	as_string: STRING is
			-- string form displayable for humans
		do
			Result := magnitude.out
			if accuracy /= 0 then
				Result.append(" +/-" + accuracy.out)
				if accuracy_is_percent then
					Result.append ("%%")
				else
					Result.append (units)
				end
			end
		end
	
	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			Result := "<magnitude>" + magnitude.out + "</magnitude>"
			Result.append("<units>" + units + "</units>")
			if accuracy /= 0 then
				Result.append("<accuracy>" + accuracy.out + "</accuracy>")
				Result.append("<accuracy_is_percent>" + accuracy_is_percent.out + "</accuracy_is_percent>")
			end
		end

invariant
	units_valid: units /= void 
	
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
--| The Original Code is dv_measurable.e.
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